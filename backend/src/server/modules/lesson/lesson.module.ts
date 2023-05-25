import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { Lesson, LessonSchema } from 'src/server/entities/lesson.entity';
import {
  SentenceCard,
  SentenceCardSchema,
} from 'src/server/entities/sentenceCard.entity';
import {
  UserFavoriteSentenceCard,
  UserFavoriteSentenceCardSchema,
} from 'src/server/entities/userFavoriteSentence.entitiy';
import {
  UserFavoriteWordCard,
  UserFavoriteWordCardSchema,
} from 'src/server/entities/userFavoriteWord.entitiy';
import { WordCard, WordCardSchema } from 'src/server/entities/wordCard.entity';
import { LessonController } from './lesson.controller';
import { LessonService } from './lesson.service';
import {
  LessonComment,
  LessonCommentSchema,
} from 'src/server/entities/lessonComment.entity';
import { User, UserSchema } from 'src/server/entities/user.entity';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Lesson.name, schema: LessonSchema },
      { name: User.name, schema: UserSchema },
      { name: WordCard.name, schema: WordCardSchema },
      { name: SentenceCard.name, schema: SentenceCardSchema },
      { name: UserFavoriteWordCard.name, schema: UserFavoriteWordCardSchema },
      {
        name: UserFavoriteSentenceCard.name,
        schema: UserFavoriteSentenceCardSchema,
      },
      { name: LessonComment.name, schema: LessonCommentSchema },
    ]),
  ],
  controllers: [LessonController],
  providers: [LessonService],
})
export class LessonModule {}
