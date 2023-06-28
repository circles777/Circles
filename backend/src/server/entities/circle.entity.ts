import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';
import { University } from './university.entity';
import { Type } from 'class-transformer';
import { Tag } from './tag.entity';
import { User } from './user.entity';
import { Address } from '../type/types';

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
    type: mongoose.Schema.Types.ObjectId,
    ref: User.name, //Address.name,
    required: true,
  })
  @Type(() => User)
  creator;

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
    ref: University.name, //Address.name,
    required: true,
  })
  @Type(() => University)
  university;

  @Prop({
    //type: mongoose.Schema.Types.ObjectId,
    //ref: 'Address', //Address.name,
    type: Object,
    required: true,
  })
  //@Type(() => Address)
  address: Address;

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

  //認可されてるかどうか(運営側で作成されたサークルを確認して認可する)
  @Prop({
    type: Boolean,
    required: true,
    default: false,
  })
  confirmed;

  //募集中かどうか
  @Prop({
    type: Boolean,
    required: true,
    default: true,
  })
  isAvailable;
}

export const CircleSchema = SchemaFactory.createForClass(Circle);
