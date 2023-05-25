import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';
import { WordCard } from './wordCard.entity';
import { User } from './user.entity';
import { Type } from 'class-transformer';
import { SentenceCard } from './sentenceCard.entity';

export type LessonDocument = Lesson & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class Lesson {
  _id: string;

  @Prop({
    type: String,
    unique: true,
    required: true,
  })
  title;

  @Prop({
    type: String,
    required: true,
  })
  introduction;

  @Prop({
    type: String,
    required: true,
  })
  description;

  wordCards?: WordCard[];
  sentenceCards?: SentenceCard[];
}

export const LessonSchema = SchemaFactory.createForClass(Lesson);
