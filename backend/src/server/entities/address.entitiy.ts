import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';

/*export type AddressDocument = Address & Document;

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class Address {
  _id: string;

  @Prop({
    type: String,
    enum: Prefecture,
    required: true,
  })
  prefecture;

  @Prop({
    type: String,
    required: true,
  })
  municipalities; //市区町村

  @Prop({
    type: String,
    required: true,
  })
  houseNumber; //番地等
}

export const AddressSchema = SchemaFactory.createForClass(Address);*/
