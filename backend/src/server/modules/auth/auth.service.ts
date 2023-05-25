import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { User } from '../../entities/user.entity';
import { Model } from 'mongoose';
import bcrypt = require('bcrypt');
import { InjectModel } from '@nestjs/mongoose';

export interface JwtPAYload {
  username: User['username'];
  email: User['email'];
  _id: User['_id'];
}

@Injectable()
export class AuthService {
  constructor(
    private jwtService: JwtService,
    @InjectModel('user')
    private readonly userRepositry: Model<User>,
  ) {}

  async validateUser(email: User['email'], pass: User['password']) {
    const user = await this.userRepositry.findOne({ email });
    if (user && bcrypt.compareSync(pass, user.password)) {
      const { password, ...result } = user.toObject(); // to remove Documnet parameter
      return result;
    }
    return null;
  }

  async jwtValidate(id: string) {
    const user = await this.userRepositry.findById(id);
    return user;
  }

  generateJwtToken(user: Omit<User, 'password'>) {
    const payload = user;
    const access_token = this.jwtService.sign(payload);
    return { access_token };
  }
}
