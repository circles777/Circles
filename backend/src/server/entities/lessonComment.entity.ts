import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose, { ObjectId } from 'mongoose';
import { Lesson } from './lesson.entity';
import { Type } from 'class-transformer';
import { User } from './user.entity';

export type LessonCommentDocument = LessonComment & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class LessonComment {
  _id: string;

  @Prop({
    type: String,
    required: true,
  })
  content;

  @Prop({
    type: mongoose.Schema.Types.ObjectId,
    ref: Lesson.name,
    required: true,
  })
  @Type(() => Lesson)
  lesson;

  @Prop({ type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true })
  @Type(() => User)
  writer;
}

export const LessonCommentSchema = SchemaFactory.createForClass(LessonComment);
