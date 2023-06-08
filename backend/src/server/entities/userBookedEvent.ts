import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';
import { User } from './user.entity';
import { Type } from 'class-transformer';

export type UserBookedEventDocument = UserBookedEvent & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class UserBookedEvent {
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
    ref: Event.name,
    required: true,
  })
  @Type(() => Event)
  event;
}

export const UserBookedEventSchema =
  SchemaFactory.createForClass(UserBookedEvent);
