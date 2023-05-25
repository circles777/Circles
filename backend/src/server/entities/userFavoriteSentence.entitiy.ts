import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';
import { User } from './user.entity';
import { Type } from 'class-transformer';
import { SentenceCard } from './sentenceCard.entity';

export type UserFavoriteSentenceDocument = UserFavoriteSentenceCard & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class UserFavoriteSentenceCard {
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
    ref: SentenceCard.name,
    required: true,
  })
  @Type(() => SentenceCard)
  sentence;
}

export const UserFavoriteSentenceCardSchema = SchemaFactory.createForClass(
  UserFavoriteSentenceCard,
);
