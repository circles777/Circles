import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Type } from 'class-transformer';
import mongoose from 'mongoose';
import { Lesson } from './lesson.entity';
import { User } from './user.entity';

export type SentenceCardDocument = SentenceCard & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class SentenceCard {
  _id: string;

  @Prop({
    type: String,
    required: true,
    unique: true,
  })
  question: string;

  @Prop({
    type: String,
    required: true,
  })
  hiragana: string;

  @Prop({
    type: String,
    required: true,
  })
  pronunciation: string;

  @Prop({ type: String, required: true })
  meaning: string;

  @Prop({
    type: mongoose.Schema.Types.ObjectId,
    ref: Lesson.name,
    required: true,
  })
  @Type(() => Lesson)
  lesson;

  @Prop({ type: mongoose.Schema.Types.ObjectId, ref: 'User' })
  @Type(() => User)
  author: User;
}

export const SentenceCardSchema = SchemaFactory.createForClass(SentenceCard);
