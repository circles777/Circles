import { Strategy as BaseLocalStrategy } from 'passport-local';

import { PassportStrategy } from '@nestjs/passport';
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { AuthService } from './auth.service';
import { User } from '../../entities/user.entity';

export type PasswordOmitUser = Omit<User, 'password'>;

@Injectable()
export class LocalStrategy extends PassportStrategy(BaseLocalStrategy) {
  constructor(private authService: AuthService) {
    // defaultだとusernameとpasswordで認証してしまう。
    super({
      usernameField: 'email',
      passwordField: 'password',
    });
  }

  //@description usernameとpasswordを使った認証処理を行うクラス
  //UseGuards(AuthGuard('local'))でmiddlerwareのように認証を行うことが可能

  async validate(
    email: User['email'],
    password: User['password'],
  ): Promise<PasswordOmitUser> {
    const user = await this.authService.validateUser(email, password);

    if (!user) {
      throw new UnauthorizedException('Your password or email is not correct.');
    }

    return user;
  }
}
