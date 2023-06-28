import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose, { ObjectId } from 'mongoose';
import { Forum } from './forum.entity';
import { Type } from 'class-transformer';
import { User } from './user.entity';

export type ForumCommentDocument = ForumComment & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class ForumComment {
  _id: string;

  @Prop({
    type: String,
    required: true,
  })
  content;

  @Prop({
    type: mongoose.Schema.Types.ObjectId,
    ref: Forum.name,
    required: true,
  })
  @Type(() => Forum)
  forum;

  @Prop({ type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true })
  @Type(() => User)
  writer;
}

export const ForumCommentSchema = SchemaFactory.createForClass(ForumComment);
