import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';

export type TagDocument = Tag & Document;

//For circle
@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class Tag {
  _id: string;

  @Prop({
    type: String,
    required: true,
    unique: true,
  })
  name;
}

export const TagSchema = SchemaFactory.createForClass(Tag);
