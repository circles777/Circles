import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Exclude, Type } from 'class-transformer';
import mongoose from 'mongoose';
import { SentenceCard } from './sentenceCard.entity';
import { WordCard, WordCardSchema } from './wordCard.entity';
import { Address } from './address.entitiy';

export type UserDocument = User & Document;

export enum UserRole {
  Author = 'author',
  Visitor = 'visitor',
}

export enum Gender {
  Male = 'male',
  Female = 'female',
  Transgender = 'transgender',
}

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class User {
  _id: string;

  @Prop({
    type: String,
    required: true,
  })
  firstName;

  @Prop({
    type: String,
    required: true,
  })
  lastName;

  @Prop({
    type: String,
    required: true,
    unique: true,
    minlength: 8,
  })
  username;

  @Prop({
    type: String,
    require: true,
    unique: true,
  })
  email;

  @Prop({
    type: String,
    enum: UserRole,
    required: true,
    default: UserRole.Visitor,
  })
  role;

  @Prop({
    type: String,
    enum: Gender,
    required: true,
  })
  gender;

  @Prop({
    type: Date,
    required: true,
  })
  birthDate;

  @Prop({
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Address', //Address.name,
    required: true,
  })
  @Type(() => Address)
  address;

  @Prop({
    type: String,
  })
  introduction;

  @Prop({
    type: String,
    require: true,
  })
  @Exclude()
  password;

  fullName: string;
}

export const UserSchema = SchemaFactory.createForClass(User);

UserSchema.virtual('fullName').get(function (this: UserDocument) {
  return `${this.firstName} ${this.lastName}`;
});

//userが消されたら、関係しているwordcardを削除
UserSchema.pre('deleteOne', async function (next) {
  const doc = await this.model.findOne(this.getFilter());
  const model = mongoose.model(WordCard.name, WordCardSchema);
  await model.deleteMany({ author: doc.id });
  next();
});
