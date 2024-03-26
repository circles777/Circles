import { Body, Controller, Get, Param, Post, UseGuards } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from 'src/server/entities/user.entity';
import { Repository } from 'typeorm';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { UserService } from './user.service';
import { Address } from '../../type/types';
import { University } from 'src/server/entities/university.entity';
import { Tag } from 'src/server/entities/tag.entity';
import { EventTag } from 'src/server/entities/eventTag.entity';

//export type SaveUserDto = Omit<User, 'password'>;
export interface CreateUserProps {
  user: Omit<User, '_id' | 'university'>;
  university?: University; //Omit<University, '_id'> & { id?: 'string' };
}

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}
  @Post('save-user')
  async saveUser(@Body() body: CreateUserProps) {
    return await this.userService.saveUser(body);
  }

  @UseGuards(JwtAuthGuard)
  @Get('get-user-by-id/:id')
  async getUserById(@Param('id') id: string) {
    return await this.userService.getUserById(id);
  }

  @UseGuards(JwtAuthGuard)
  @Post('update-user')
  async updateUser(@Body() body: User) {
    return await this.userService.updateUser(body);
  }
}
