import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { User } from 'src/server/entities/user.entity';
import * as bcrypt from 'bcrypt';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';

@Injectable()
export class UserService {
  constructor(
    @InjectModel('user')
    private readonly userRepository: Model<User>,
  ) {}

  async saveUser(user: User) {
    const { email, password } = user;
    const existsUser = await this.userRepository.findOne({ email }).exec();
    //console.log(existsUser);
    if (existsUser) {
      console.log('already exists');
      throw new HttpException(
        'email already registered',
        HttpStatus.BAD_REQUEST,
      );
    }
    const newUser = await this.userRepository.create(user);
    const salt = await bcrypt.genSalt();
    const passwordHash = await bcrypt.hash(password, salt);
    newUser.password = passwordHash;
    return await newUser.save();
  }

  async getUserById(id: string) {
    return await (await this.userRepository.findById(id).exec()).toObject();
  }

  async updateUser(user: User): Promise<User> {
    await this.userRepository.updateOne({ _id: user._id }, user).exec();
    return await (
      await this.userRepository.findOne({ _id: user._id }).exec()
    ).toObject();
  }
}
