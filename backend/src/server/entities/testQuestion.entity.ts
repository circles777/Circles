import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose, { ObjectId } from 'mongoose';
import { Lesson } from './lesson.entity';
import { Type } from 'class-transformer';
import { WordCard } from './wordCard.entity';

export type TestQuestionDocument = TestQuestion & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class TestQuestion {
  _id: string;

  @Prop({
    type: mongoose.Schema.Types.ObjectId,
    ref: Lesson.name,
    required: true,
  })
  @Type(() => Lesson)
  lesson;

  @Prop({
    type: mongoose.Schema.Types.ObjectId,
    ref: WordCard.name,
    required: true,
  })
  @Type(() => WordCard)
  answer;

  @Prop({ type: String, required: true })
  question;

  @Prop({ type: String, required: true })
  meaning;

  @Prop({
    required: true,
  })
  options: Array<string>;
}

export const TestQuestionSchema = SchemaFactory.createForClass(TestQuestion);
