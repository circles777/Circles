import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Exclude, Type } from 'class-transformer';
import mongoose from 'mongoose';
import { Address } from './address.entitiy';

export type UniversityDocument = University & Document;

export enum UniversityType {
  Private = 'private',
  Nation = 'nation',
  Public = 'public',
}

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class University {
  _id: string;

  @Prop({
    type: String,
    required: true,
  })
  name;

  @Prop({
    type: String,
    enum: UniversityType,
    required: true,
  })
  university_type;

  @Prop({
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Address', //Address.name,
    required: true,
  })
  @Type(() => Address)
  address;

  @Prop({
    type: String,
    unique: true,
    minlength: 8,
  })
  url;
}

export const UniversitySchema = SchemaFactory.createForClass(University);
