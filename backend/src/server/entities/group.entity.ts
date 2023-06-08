import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Exclude, Type } from 'class-transformer';
import mongoose from 'mongoose';
import { Address } from './address.entitiy';

export type GroupDocument = Group & Document;

export enum GroupType {
  School = 'school',
  Company = 'company',
}

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class Group {
  _id: string;

  @Prop({
    type: String,
    required: true,
  })
  name;

  @Prop({
    type: String,
    enum: GroupType,
    required: true,
  })
  type;

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

export const GroupSchema = SchemaFactory.createForClass(Group);
