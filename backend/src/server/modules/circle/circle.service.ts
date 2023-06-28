import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User } from 'src/server/entities/user.entity';
import { SaveCircleProps } from './circle.controller';
import { Address } from 'src/server/entities/address.entitiy';
import { Circle } from 'src/server/entities/circle.entity';
import { Group } from 'src/server/entities/university.entity';
import { Tag } from 'src/server/entities/tag.entity';

@Injectable()
export class CircleService {
  constructor(
    @InjectModel(Circle.name)
    private readonly circleModel: Model<Circle>,

    @InjectModel(Group.name)
    private readonly universityModel: Model<Group>,

    @InjectModel(Address.name)
    private readonly addressModel: Model<Address>,

    @InjectModel(Tag.name)
    private readonly tagModel: Model<Tag>,

    @InjectModel(User.name)
    private readonly userModel: Model<User>,
  ) {}

  async saveCircle(body: SaveCircleProps, user: User): Promise<Circle> {
    const newAddress = new this.addressModel({
      prefecture: body.prefecture,
      municipalities: body.municipalities,
      houseNumber: body.houseNumber,
    });
    const savedAddress = (await newAddress.save()).toObject();
    const newCircle = new this.circleModel({
      creator: user,
      name: body.name,
      introduction: body.introduction,
      detail: body.detail,
      group: body.group,
      address: savedAddress,
      foundedDate: body.foundedDate,
      contactNumber: body.contactNumber,
      numberOfMembers: body.numberOfMembers,
      tags: body.tags,
    });
    const savedCircle = (
      await (
        await (
          await (
            await newCircle.save()
          ).populate('university', '', this.universityModel)
        ).populate('address', '', this.addressModel)
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
    await body.address.updateOne({ _id: body.address._id }, body.address);
    const address = (
      await this.addressModel.findById(body.address._id)
    ).toObject();
    await this.circleModel.updateOne({ _id: body._id }, body);
    const updatedCircle = (
      await this.circleModel.findById(body._id)
    ).toObject();
    return {
      ...updatedCircle,
      group: body.group,
      address,
      tags: body.tags,
    };
  }

  async getCircleOne(id: string): Promise<Circle> {
    return (
      await (
        await (
          await (await this.circleModel.findById(id)).populate('university')
        ).populate('address')
      ).populate('tags')
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
}
