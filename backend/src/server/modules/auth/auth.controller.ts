import { Controller, Post, UseGuards, Request } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { AuthService } from './auth.service';
import { PasswordOmitUser } from './local.strategy';
import { Request as RequestType } from 'express';
import { User } from 'src/server/entities/user.entity';
import { JwtAuthGuard } from './jwt-auth.guard';

export interface RequestWithUser extends RequestType {
  user: User; //PasswordOmitUser;
}

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @UseGuards(AuthGuard('local'))
  @Post('login')
  async login(@Request() req: RequestWithUser) {
    const user = req.user;
    const { access_token } = this.authService.generateJwtToken(user);
    return { ...user, access_token };
  }

  @UseGuards(JwtAuthGuard)
  @Post('authenticate')
  async authenticate(@Request() req: RequestWithUser) {
    const user = req.user;
    if (!user) {
      throw new Error('Not authenticated');
    }
    user.password = undefined;
    return user;
  }
}
