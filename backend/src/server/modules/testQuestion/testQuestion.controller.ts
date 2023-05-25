import {
  Body,
  Controller,
  Get,
  Param,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import { RequestWithUser } from '../auth/auth.controller';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { TestQuestionService } from './testQuestion.service';
import { TestQuestionResult } from 'src/server/entities/testQuestionResult';

export interface SaveTestQuestionProps {
  question: string;
  meaning: string;
  answer: string; //id
  lesson: string; //id
  options: Array<string>;
}

export interface UpdateTestQuestionProps {
  _id: string;
  question: string;
  meaning: string;
  answer: string; //id
  lesson: string; //id
  options: Array<string>;
}

export interface SaveTestQuestionResultProps {
  lessonId: string;
  questionNumber: number;
  score: number;
}

@Controller('test-question')
export class TestQuestionController {
  constructor(private readonly testQuestionService: TestQuestionService) {}

  @UseGuards(JwtAuthGuard)
  @Post('save-test-question')
  async saveTestQuestion(
    @Req() req: RequestWithUser,
    @Body() body: SaveTestQuestionProps,
  ) {
    return await this.testQuestionService.saveTestQuestion(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('update-test-question')
  async updateTestQuestion(
    @Req() req: RequestWithUser,
    @Body() body: UpdateTestQuestionProps,
  ) {
    return await this.testQuestionService.updateTestQuestion(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Get('get-test-questions/:id')
  async getTestQuestions(@Param('id') id: string) {
    return await this.testQuestionService.getTestQuestions(id);
  }

  @UseGuards(JwtAuthGuard)
  @Post('save-test-result')
  async saveTestResult(
    @Req() req: RequestWithUser,
    @Body() body: SaveTestQuestionResultProps,
  ): Promise<TestQuestionResult> {
    return await this.testQuestionService.saveTestQuestionResult(
      body,
      req.user,
    );
  }

  @UseGuards(JwtAuthGuard)
  @Get('get-test-results')
  async getTestResults(
    @Req() req: RequestWithUser,
  ): Promise<TestQuestionResult[]> {
    return await this.testQuestionService.getTestQuestionResults(req.user);
  }
}
