import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose, { ObjectId } from 'mongoose';
import { Type } from 'class-transformer';
import { User } from './user.entity';
import { Lesson } from './lesson.entity';

export type TestQuestionResultDocument = TestQuestionResult & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class TestQuestionResult {
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
    ref: User.name,
    required: true,
  })
  @Type(() => User)
  user;

  @Prop({ type: Number, required: true })
  questionNumber;

  @Prop({ type: Number, required: true })
  score;
}

export const TestQuestionResultSchema =
  SchemaFactory.createForClass(TestQuestionResult);
