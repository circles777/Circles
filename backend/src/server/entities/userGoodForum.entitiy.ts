import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';
import { User } from './user.entity';
import { Type } from 'class-transformer';
import { Forum } from './forum.entity';

export type UserGoodForumDocument = UserGoodForum & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class UserGoodForum {
  _id: string;
  @Prop({
    type: mongoose.Schema.Types.ObjectId,
    ref: User.name,
    required: true,
  })
  @Type(() => User)
  user;

  @Prop({
    type: mongoose.Schema.Types.ObjectId,
    ref: Forum.name,
    required: true,
  })
  @Type(() => Forum)
  forum;
}

export const UserGoodForumSchema = SchemaFactory.createForClass(UserGoodForum);
