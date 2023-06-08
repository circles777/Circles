import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';
import { Address } from './address.entitiy';
import { Type } from 'class-transformer';
import { EventTag } from './eventTag.entity';
import { Circle } from './circle.entity';
import { UserBookedEvent } from './userBookedEvent';

export type EventDocument = Event & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class Event {
  _id: string;

  @Prop({
    type: String,
    required: true,
  })
  title;

  @Prop({
    type: mongoose.Schema.Types.ObjectId,
    ref: Circle.name, //Address.name,
    required: true,
  })
  @Type(() => Circle)
  circle;

  @Prop({
    type: Date,
    required: true,
  })
  recruitEndedAt;

  @Prop({
    type: Date,
    required: true,
  })
  startedAt;

  @Prop({
    type: Date,
    required: true,
  })
  endedAt;

  @Prop({
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Address', //Address.name,
    required: true,
  })
  @Type(() => Address)
  address;

  //定員
  @Prop({
    type: Number,
    required: true,
    min: 1,
  })
  capacity;

  @Prop({
    type: Number,
    required: true,
    min: 0,
  })
  participationFee;

  @Prop({
    type: String,
    required: true,
    maxlength: 300,
  })
  detail;

  @Prop([
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: EventTag.name,
    },
  ])
  @Type(() => EventTag)
  eventTags;

  userBookedEvents?: UserBookedEvent[];
}

export const EventSchema = SchemaFactory.createForClass(Event);
