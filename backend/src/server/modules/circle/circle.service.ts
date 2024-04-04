import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User } from 'src/server/entities/user.entity';
import { SaveCircleProps, SaveTagProps } from './circle.controller';
import { Circle } from 'src/server/entities/circle.entity';
import { University } from 'src/server/entities/university.entity';
import { Tag } from 'src/server/entities/tag.entity';

@Injectable()
export class CircleService {
  constructor(
    @InjectModel(Circle.name)
    private readonly circleModel: Model<Circle>,

    @InjectModel(University.name)
    private readonly universityModel: Model<University>,

    @InjectModel(Tag.name)
    private readonly tagModel: Model<Tag>,

    @InjectModel(User.name)
    private readonly userModel: Model<User>,
  ) {}

  async saveCircle(body: SaveCircleProps, user: User): Promise<Circle> {
    const newCircle = new this.circleModel({
      creator: user,
      name: body.name,
      introduction: body.introduction,
      detail: body.detail,
      university: body.university,
      address: body.address,
      foundedDate: body.foundedDate,
      contactNumber: body.contactNumber,
      numberOfMembers: body.numberOfMembers,
      tags: body.tags,
    });
    const savedCircle = (
      await (
        await (
          await newCircle.save()
        ).populate('university', '', this.universityModel)
      ).populate('tags', '', this.tagModel)
    ).toObject();
    return savedCircle;
  }

  async updateCircle(body: Circle, user: User): Promise<Circle> {
    if (user.role !== 'author' && body.creator !== user._id.toString()) {
      throw new HttpException(
        "You don't have the right to update this circle.",
        HttpStatus.BAD_REQUEST,
      );
    }
    /*await body.address.updateOne({ _id: body.address._id }, body.address);
    const address = (
      await this.addressModel.findById(body.address._id)
    ).toObject();*/
    await this.circleModel.updateOne({ _id: body._id }, body);
    const updatedCircle = (
      await (
        await (
          await this.circleModel.findById(body._id)
        ).populate('university', '', this.universityModel)
      ).populate('tags', '', this.tagModel)
    ).toObject();
    return updatedCircle;
  }

  async getCircles(): Promise<Array<Circle>> {
    const circles = await this.circleModel.find();
    const res = await Promise.all(
      circles.map(async (c) => {
        const r = await (
          await c.populate('university', '', this.universityModel)
        ).populate('tags', '', this.tagModel);
        return r;
      }),
    );
    return res;
  }

  async getCircleOne(id: string): Promise<Circle> {
    return (
      await (
        await (
          await (await this.circleModel.findById(id)).populate('university')
        ).populate('university', '', this.universityModel)
      ).populate('tags', '', this.tagModel)
    ).toObject();
  }

  async deleteCircleOne(id: string, user: User): Promise<Circle> {
    const deletedCircle = (await this.circleModel.findById(id)).toObject();
    if (
      user.role !== 'author' &&
      deletedCircle.creator !== user._id.toString()
    ) {
      throw new HttpException(
        "You don't have the right to delete this circle.",
        HttpStatus.BAD_REQUEST,
      );
    }
    await this.circleModel.deleteOne(deletedCircle);
    return deletedCircle;
  }

  async confirmCircle(id: string, user: User): Promise<Circle> {
    if (user.role !== 'author') {
      throw new HttpException(
        "You don't have the right to confirm this circle.",
        HttpStatus.BAD_REQUEST,
      );
    }
    await this.circleModel.updateOne({ _id: id }, { confirmed: true });
    return await this.getCircleOne(id);
  }

  async saveTag(body: SaveTagProps): Promise<Tag> {
    const newTag = this.tagModel.create(body);
    const savedTag = (await newTag).save();
    return (await savedTag).toObject();
  }

  async deleteTag(id: string, user: User): Promise<Tag> {
    if (user.role !== 'author') {
      throw new HttpException(
        "You don't have the right to delete tags.",
        HttpStatus.BAD_REQUEST,
      );
    }
    const deletedTag = await this.tagModel.findById(id);
    await this.tagModel.deleteOne({ _id: id });
    return deletedTag.toObject();
  }
}
