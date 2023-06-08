import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';

export type EventTagDocument = EventTag & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class EventTag {
  _id: string;

  @Prop({
    type: String,
    required: true,
    unique: true,
  })
  name;
}

export const EventTagSchema = SchemaFactory.createForClass(EventTag);
