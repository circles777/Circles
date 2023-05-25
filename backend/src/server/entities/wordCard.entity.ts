import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Exclude, Transform, Type } from 'class-transformer';
import { number } from 'joi';
import mongoose from 'mongoose';
import { PrimaryGeneratedColumn, Repository } from 'typeorm';
import { Lesson } from './lesson.entity';
import { User, UserSchema } from './user.entity';

export type WordCardDocument = WordCard & Document;

export enum WordPattern {
  Subject = 'subject', // 主語
  Verb = 'verb', // 動詞
  Object = 'object', //目的語
  Adjective = 'adjective', //形容詞 ex(fine, good, bad)
  Conjunction = 'conjunction', //接続詞 ex(but, and, otherwise)
  Preposition = 'preposition', //前置詞 ex(from, as, to)
  Adverb = 'adverb', //副詞 ex(usually, always)
}

@Schema({
  autoIndex: true,
  toJSON: {
    virtuals: true,
  },
  timestamps: true,
})
export class WordCard {
  _id: string;

  @Prop({
    type: String,
    required: true,
  })
  question;

  @Prop({
    type: String,
    required: true,
  })
  hiragana;

  @Prop({
    type: String,
    required: true,
  })
  pronunciation;

  @Prop({
    type: String,
    required: true,
  })
  meaning;

  @Prop({
    type: String,
    enum: WordPattern,
    required: true,
  })
  pattern;

  @Prop([
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: Lesson.name,
    },
  ])
  @Type(() => Lesson)
  lessons;

  @Prop({
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User', //User.name,
    required: true,
  })
  @Type(() => User)
  author;

  isUserFavorite?: boolean = false;
  isDuplicate?: boolean = false;
}

export const WordCardSchema = SchemaFactory.createForClass(WordCard);
