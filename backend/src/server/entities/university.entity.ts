import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Type } from 'class-transformer';
import mongoose from 'mongoose';
import { Address } from '../type/types';

export type UniversityDocument = University & Document;

/*export enum GroupType {
  School = 'school',
  Company = 'company',
}*/

export enum UniversityDictionary {
  TUS = '東京理科大学',
  UT = '東京大学',
  KU = '京都大学',
  TT = '東京工業大学',
  Sophia = '上智大学',
  Waseda = '早稲田大学',
  Keio = '慶應大学',
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
    enum: UniversityDictionary,
    required: true,
  })
  university;

  @Prop({
    type: String,
    //required: true,
  })
  campus;

  @Prop({
    //type: mongoose.Schema.Types.ObjectId,
    //ref: 'Address', //Address.name,
    type: Object,
    required: true,
  })
  //@Type(() => Address)
  address: Address;
}

export const UniversitySchema = SchemaFactory.createForClass(University);
