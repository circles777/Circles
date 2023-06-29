import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User } from 'src/server/entities/user.entity';
import { SaveUniversityProps } from './university.controller';

import { Circle } from 'src/server/entities/circle.entity';
import { University } from 'src/server/entities/university.entity';
import { Tag } from 'src/server/entities/tag.entity';

@Injectable()
export class UniversityService {
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

  async saveUniversity(
    body: SaveUniversityProps,
    user: User,
  ): Promise<University> {
    //const savedAddress = (await newAddress.save()).toObject();
    const existedUniversity = await this.universityModel.findOne({
      university: body.university,
      campus: body.campus,
    });
    if (existedUniversity) {
      throw new HttpException(
        'The university or campus is existed.',
        HttpStatus.BAD_REQUEST,
      );
    }
    const newUniversity = this.universityModel.create(body);
    const savedUniversity = (await newUniversity).save();
    return savedUniversity;
  }

  async updateUniversity(body: University, user: User): Promise<University> {
    if (user.role !== 'author') {
      throw new HttpException(
        "You don't have the right to update this university.",
        HttpStatus.BAD_REQUEST,
      );
    }
    await this.universityModel.updateOne({ _id: body._id }, body);
    const updatedUniversity = (
      await this.universityModel.findById(body._id)
    ).toObject();
    return updatedUniversity;
  }

  async getUniversityOne(id: string): Promise<University> {
    return (await await this.universityModel.findById(id)).toObject();
  }

  async deleteUniversityOne(id: string, user: User): Promise<University> {
    const deletedUniversity = (
      await this.universityModel.findById(id)
    ).toObject();
    if (user.role !== 'author') {
      throw new HttpException(
        "You don't have the right to delete this university.",
        HttpStatus.BAD_REQUEST,
      );
    }
    await this.universityModel.deleteOne(deletedUniversity);
    return deletedUniversity;
  }

  /*async confirmCircle(id: string, user: User): Promise<Circle> {
    if (user.role !== 'author') {
      throw new HttpException(
        "You don't have the right to confirm this circle.",
        HttpStatus.BAD_REQUEST,
      );
    }
    await this.circleModel.updateOne({ _id: id }, { confirmed: true });
    return await this.getCircleOne(id);
  }*/
}
