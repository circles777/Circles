import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User } from 'src/server/entities/user.entity';
import { SaveEventProps } from './event.controller';
import { Address } from 'src/server/entities/address.entitiy';
import { Circle } from 'src/server/entities/circle.entity';
import { Group } from 'src/server/entities/group.entity';
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

    @InjectModel(Group.name)
    private readonly groupModel: Model<Group>,

    @InjectModel(Address.name)
    private readonly addressModel: Model<Address>,

    @InjectModel(EventTag.name)
    private readonly eventTagModel: Model<EventTag>,

    @InjectModel(User.name)
    private readonly userModel: Model<User>,

    @InjectModel(UserBookedEvent.name)
    private readonly userBookedEventModel: Model<UserBookedEvent>,
  ) {}

  async saveEvent(body: SaveEventProps, user: User): Promise<Event> {
    const newAddress = new this.addressModel({
      prefecture: body.prefecture,
      municipalities: body.municipalities,
      houseNumber: body.houseNumber,
    });
    const savedAddress = (await newAddress.save()).toObject();
    const newEvent = new this.eventModel({
      title: body.title,
      circle: body.circleID,
      recruitEndedAt: body.recruitEndedAt,
      startedAt: body.startedAt,
      endedAt: body.endedAt,
      address: savedAddress,
      capacity: body.capacity,
      participationFee: body.participationFee,
      detail: body.detail,
      eventTags: body.eventTags,
    });
    const savedEvent = (
      await (
        await (
          await (await newEvent.save()).populate('group', '', this.groupModel)
        ).populate('address', '', this.addressModel)
      ).populate('eventTags', '', this.eventTagModel)
    ).toObject();
    return savedEvent;
  }

  async updateEvent(body: Event, user: User): Promise<Event> {
    await body.address.updateOne({ _id: body.address._id }, body.address);
    const address = (
      await this.addressModel.findById(body.address._id)
    ).toObject();
    await this.eventModel.updateOne({ _id: body._id }, body);
    const updatedEvent = (await this.eventModel.findById(body._id)).toObject();
    return {
      ...updatedEvent,
      address,
      eventTags: body.eventTags,
    };
  }

  async getEventOne(id: string): Promise<Event> {
    const event = (
      await (
        await (
          await (await this.eventModel.findById(id)).populate('group')
        ).populate('address')
      ).populate('eventTags')
    ).toObject();
    const userBookedEvents = await this.userBookedEventModel
      .find({ event: event })
      .populate('user', '', this.userModel);
    event.userBookedEvents = userBookedEvents.map((u) => u.toObject());
    return event;
  }

  async deleteEventOne(id: string): Promise<Event> {
    const deletedCircle = (await this.eventModel.findById(id)).toObject();
    await this.eventModel.deleteOne(deletedCircle);
    return deletedCircle;
  }
}
