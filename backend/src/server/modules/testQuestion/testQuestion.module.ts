import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { Lesson, LessonSchema } from 'src/server/entities/lesson.entity';
import { WordCard, WordCardSchema } from 'src/server/entities/wordCard.entity';
import { TestQuestionController } from './testQuestion.controller';
import { TestQuestionService } from './testQuestion.service';
import { User, UserSchema } from 'src/server/entities/user.entity';
import {
  TestQuestion,
  TestQuestionSchema,
} from 'src/server/entities/testQuestion.entity';
import {
  TestQuestionResult,
  TestQuestionResultSchema,
} from 'src/server/entities/testQuestionResult';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Lesson.name, schema: LessonSchema },
      { name: User.name, schema: UserSchema },
      { name: WordCard.name, schema: WordCardSchema },
      { name: TestQuestion.name, schema: TestQuestionSchema },
      { name: TestQuestionResult.name, schema: TestQuestionResultSchema },
    ]),
  ],
  controllers: [TestQuestionController],
  providers: [TestQuestionService],
})
export class TestQuestionModule {}
