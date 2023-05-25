import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Lesson } from 'src/server/entities/lesson.entity';
import { TestQuestion } from 'src/server/entities/testQuestion.entity';
import { User } from 'src/server/entities/user.entity';
import { WordCard } from 'src/server/entities/wordCard.entity';
import {
  SaveTestQuestionProps,
  SaveTestQuestionResultProps,
  UpdateTestQuestionProps,
} from './testQuestion.controller';
import { TestQuestionResult } from 'src/server/entities/testQuestionResult';

@Injectable()
export class TestQuestionService {
  constructor(
    @InjectModel(Lesson.name)
    private readonly lessonModel: Model<Lesson>,

    @InjectModel(User.name)
    private readonly userModel: Model<User>,

    @InjectModel(WordCard.name)
    private readonly wordCardModel: Model<WordCard>,

    @InjectModel(TestQuestion.name)
    private readonly testQuestionModel: Model<TestQuestion>,

    @InjectModel(TestQuestionResult.name)
    private readonly testQuestionResultModal: Model<TestQuestionResult>,
  ) {}

  async saveTestQuestion(
    body: SaveTestQuestionProps,
    user: User,
  ): Promise<TestQuestion> {
    if (user.role !== 'author') {
      throw new HttpException(
        "You don't have right to create test questions.",
        HttpStatus.BAD_REQUEST,
      );
    }
    const newTest = await this.testQuestionModel.create(body);
    const savedTest = await newTest.save();
    const res = await this.testQuestionModel
      .findById(savedTest._id)
      .populate('answer', '', this.wordCardModel)
      .exec();
    return res.toObject();
  }

  async updateTestQuestion(
    body: UpdateTestQuestionProps,
    user: User,
  ): Promise<TestQuestion> {
    if (user.role !== 'author') {
      throw new HttpException(
        "You don't have right to create test questions.",
        HttpStatus.BAD_REQUEST,
      );
    }
    await this.testQuestionModel.updateOne({ _id: body._id }, body).exec();
    const res = await this.testQuestionModel
      .findById(body._id)
      .populate('answer', '', this.wordCardModel)
      .exec();
    return res.toObject();
  }

  async getTestQuestions(id: string): Promise<TestQuestion[]> {
    const testQuestions = await this.testQuestionModel
      .find({ lesson: id })
      .populate('answer', '', this.wordCardModel)
      .exec();
    return testQuestions;
  }

  async saveTestQuestionResult(
    body: SaveTestQuestionResultProps,
    user: User,
  ): Promise<TestQuestionResult> {
    const newResult = new this.testQuestionResultModal();
    newResult.lesson = body.lessonId;
    newResult.questionNumber = body.questionNumber;
    newResult.score = body.score;
    newResult.user = user;
    return await newResult.save();
  }

  async getTestQuestionResults(user: User): Promise<TestQuestionResult[]> {
    const results = await this.testQuestionResultModal
      .find({ user: user._id })
      .populate('lesson', '', this.lessonModel)
      .exec();
    return results.map((r) => r.toObject());
  }
}
