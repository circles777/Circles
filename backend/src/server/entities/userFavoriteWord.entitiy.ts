import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';
import { WordCard } from './wordCard.entity';
import { User } from './user.entity';
import { Type } from 'class-transformer';

export type UserFavoriteWordDocument = UserFavoriteWordCard & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class UserFavoriteWordCard {
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
    ref: WordCard.name,
    required: true,
  })
  @Type(() => WordCard)
  word;
}

export const UserFavoriteWordCardSchema =
  SchemaFactory.createForClass(UserFavoriteWordCard);
