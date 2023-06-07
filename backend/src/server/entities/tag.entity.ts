import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';

export enum TagType {
  Event = 'event',
  Circle = 'circle',
}

export type TagDocument = Tag & Document;

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
  })
  name;

  @Prop({
    type: String,
    enum: TagType,
    required: true,
  })
  type;
}

export const TagSchema = SchemaFactory.createForClass(Tag);
