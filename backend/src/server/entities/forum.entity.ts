import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';
import { User } from './user.entity';
import { Type } from 'class-transformer';

export type ForumDocument = Forum & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class Forum {
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
  content;

  @Prop({ type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true })
  @Type(() => User)
  writer;
}

export const ForumSchema = SchemaFactory.createForClass(Forum);
