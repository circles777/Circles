import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User, UserRole } from 'src/server/entities/user.entity';
import { SaveEventProps, SaveEventTagProps } from './event.controller';
import { Circle } from 'src/server/entities/circle.entity';
import { Event } from 'src/server/entities/event.entity';
import { EventTag } from 'src/server/entities/eventTag.entity';
import { UserBookedEvent } from 'src/server/entities/userBookedEvent';

@Injectable()
export class EventService {
  constructor(
    @InjectModel(Event.name)
    private readonly eventModel: Model<Event>,

    @InjectModel(Circle.name)
    private readonly circleModel: Model<Circle>,

    @InjectModel(EventTag.name)
    private readonly eventTagModel: Model<EventTag>,

    @InjectModel(User.name)
    private readonly userModel: Model<User>,

    @InjectModel(UserBookedEvent.name)
    private readonly userBookedEventModel: Model<UserBookedEvent>,
  ) {}

  async saveEvent(body: SaveEventProps, user: User): Promise<Event> {
    const newEvent = new this.eventModel({
      title: body.title,
      circle: body.circle,
      recruitEndedAt: body.recruitEndedAt,
      startedAt: body.startedAt,
      endedAt: body.endedAt,
      address: body.address,
      capacity: body.capacity,
      participationFee: body.participationFee,
      detail: body.detail,
      eventTags: body.eventTags,
    });
    const savedEvent = (
      await (
        await newEvent.save()
      ).populate('eventTags', '', this.eventTagModel)
    ).toObject();
    return savedEvent;
  }

  async updateEvent(body: Event, user: User): Promise<Event> {
    await this.eventModel.updateOne({ _id: body._id }, body);
    const updatedEvent = (await this.eventModel.findById(body._id)).populate(
      'eventTags',
      '',
      this.eventTagModel,
    );
    return (await updatedEvent).toObject();
  }

  async getEventOne(id: string): Promise<Event> {
    const event = (
      await (await this.eventModel.findById(id)).populate('eventTags')
    ).toObject();
    const userBookedEvents = await this.userBookedEventModel
      .find({ event: event })
      .populate('user', '', this.userModel);
    event.userBookedEvents = userBookedEvents.map((u) => u.toObject());
    return event;
  }

  async deleteEventOne(id: string, user: User): Promise<Event> {
    const deletedEvent = await (
      await this.eventModel.findById(id)
    ).populate('creator', '', this.userModel);

    const res = (await deletedEvent).toObject();
    if (res.creator._id.eqauals(user._id) || user.role === UserRole.Author) {
      await this.eventModel.deleteOne({ _id: deletedEvent._id });
    } else {
      throw new HttpException(
        "You don't have the right to delete this event.",
        HttpStatus.BAD_REQUEST,
      );
    }
    return res;
  }

  async saveEventTag(body: SaveEventTagProps): Promise<EventTag> {
    const newTag = await this.eventTagModel.create(body);
    const savedTag = (await newTag.save()).toObject();
    return savedTag;
  }

  async deleteEventTag(id: string, user: User): Promise<EventTag> {
    if (user.role !== UserRole.Author) {
      throw new HttpException(
        "You don't have the right to delete this event tag.",
        HttpStatus.BAD_REQUEST,
      );
    }
    const deletedTag = (await this.eventTagModel.findById(id)).toObject();
    await this.eventTagModel.deleteOne(deletedTag);
    return deletedTag;
  }
}
