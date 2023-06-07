import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';
import { Address } from './address.entitiy';
import { University } from './university.entity';
import { Type } from 'class-transformer';
import { Tag } from './tag.entity';

export type CircleDocument = Circle & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class Circle {
  _id: string;

  @Prop({
    type: String,
    required: true,
  })
  name;

  @Prop({
    type: String,
    required: true,
    maxlength: 20,
  })
  introduction;

  @Prop({
    type: String,
    required: true,
    maxlength: 300,
  })
  detail;

  @Prop({
    type: mongoose.Schema.Types.ObjectId,
    ref: 'University', //Address.name,
    required: true,
  })
  @Type(() => University)
  university;

  @Prop({
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Address', //Address.name,
    required: true,
  })
  @Type(() => Address)
  address;

  @Prop({
    type: Date,
    required: true,
  })
  foundedDate;

  @Prop({
    type: String,
    required: true,
    unique: true,
  })
  contactNumber;

  @Prop({
    type: Number,
    required: true,
    min: 0,
  })
  numberOfMembers;

  @Prop([
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: Tag.name,
    },
  ])
  @Type(() => Tag)
  tags;
}

export const CircleSchema = SchemaFactory.createForClass(Circle);
