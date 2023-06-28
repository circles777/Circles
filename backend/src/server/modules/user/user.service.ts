import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { User } from 'src/server/entities/user.entity';
import * as bcrypt from 'bcrypt';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Tag } from 'src/server/entities/tag.entity';
import { Address } from '../../type/types';
import { University } from 'src/server/entities/university.entity';
import { privateDecrypt } from 'crypto';
import { CreateUserProps } from './user.controller';

@Injectable()
export class UserService {
  constructor(
    @InjectModel('user')
    private readonly userModel: Model<User>,
    @InjectModel(Tag.name)
    private readonly tagModel: Model<Tag>,
    @InjectModel(University.name)
    private readonly universityModel: Model<University>,
  ) {}

  async saveUser(props: CreateUserProps) {
    const { email, password } = props.user;
    const existsUser = await this.userModel.findOne({ email }).exec();
    //console.log(existsUser);
    if (existsUser) {
      console.log('already exists');
      throw new HttpException(
        'email already registered',
        HttpStatus.BAD_REQUEST,
      );
    }
    let newUniversity;
    if (props.university && !props.university._id) {
      newUniversity = await this.universityModel.create(props.university);
      await newUniversity.save();
      newUniversity = newUniversity.toObject();
    }
    const newUser = await this.userModel.create(props.user);
    const salt = await bcrypt.genSalt();
    const passwordHash = await bcrypt.hash(password, salt);
    newUser.password = passwordHash;
    newUser.university = newUniversity || props.university;
    return await newUser.save();
  }

  async getUserById(id: string) {
    return await (await this.userModel.findById(id).exec()).toObject();
  }

  async updateUser(user: User): Promise<User> {
    await this.userModel.updateOne({ _id: user._id }, user).exec();
    return await (
      await this.userModel.findOne({ _id: user._id }).exec()
    ).toObject();
  }
}
