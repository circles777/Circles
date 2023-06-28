import {
  Body,
  Controller,
  Get,
  Param,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import { Lesson } from 'src/server/entities/forum.entity';
import { LessonComment } from 'src/server/entities/forumComment.entity';
import { SentenceCard } from 'src/server/entities/sentenceCard.entity';
import { WordCard } from 'src/server/entities/wordCard.entity';
import { RequestWithUser } from '../auth/auth.controller';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { LessonService } from './lesson.service';
export interface CreateLessonProps {
  title: string;
  introduction: string;
  description: string;
}

export interface CreateWordCardProps {
  lessonId: string;
  question: string;
  hiragana: string;
  pronunciation: string;
  meaning: string;
  pattern: string;
}

export interface CreateSentenceCardProps {
  lessonId: string;
  question: string;
  hiragana: string;
  pronunciation: string;
  meaning: string;
}

export interface SaveLessonCommentDto {
  lessonId: string;
  content: string;
}

export interface DeleteSentenceCardProps {
  lessonId: string;
  id: string;
}

@Controller('lesson')
export class LessonController {
  constructor(private readonly lessonService: LessonService) {}

  @UseGuards(JwtAuthGuard)
  @Post('create-lesson')
  async createLesson(
    @Req() req: RequestWithUser,
    @Body() body: CreateLessonProps,
  ) {
    return await this.lessonService.createLesson(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('update-lesson')
  async updateLesson(@Req() req: RequestWithUser, @Body() body: Lesson) {
    return await this.lessonService.updateLesson(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Get('get-lessons')
  async getLessons() {
    return await this.lessonService.getLessons();
  }

  @UseGuards(JwtAuthGuard)
  @Get('get-lesson-detail/:id')
  async getLessonDetail(
    @Req() req: RequestWithUser,
    @Param() param: { id: string },
  ): Promise<Lesson> {
    return await this.lessonService.getLessonDetail(param.id, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('create-word-card')
  async createWordCard(
    @Req() req: RequestWithUser,
    @Body() body: CreateWordCardProps,
  ) {
    return await this.lessonService.createWordCard(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('create-word-card-for-personal')
  async createWordCardForPersonal(
    @Req() req: RequestWithUser,
    @Body() body: Omit<WordCard, '_id'>,
  ) {
    return await this.lessonService.createWordCardForPersonal(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('update-word-card')
  async updateWordCard(@Req() req: RequestWithUser, @Body() body: WordCard) {
    return await this.lessonService.updateWordCard(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('save-favorite-word-card')
  async saveFavoriteWordCard(
    @Req() req: RequestWithUser,
    @Body() body: { id: string },
  ) {
    return await this.lessonService.saveFavoriteWordCard(body.id, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Get('get-user-favorite-word-cards')
  async getUserFavoriteWordCards(@Req() req: RequestWithUser) {
    return await this.lessonService.getUserFavoriteWordCards(req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('create-sentence-card')
  async createSentenceCard(
    @Req() req: RequestWithUser,
    @Body() body: CreateSentenceCardProps,
  ) {
    return await this.lessonService.createSentenceCard(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('update-sentence-card')
  async updateSentenceCard(
    @Req() req: RequestWithUser,
    @Body() body: SentenceCard,
  ) {
    return await this.lessonService.updateSentenceCard(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('delete-sentence-card')
  async deleteSentenceCard(
    @Req() req: RequestWithUser,
    @Body() body: DeleteSentenceCardProps,
  ) {
    return await this.lessonService.deleteSentenceCard(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('save-lesson-comment')
  async saveLessonComment(
    @Req() req: RequestWithUser,
    @Body() body: SaveLessonCommentDto,
  ): Promise<LessonComment> {
    return await this.lessonService.saveLessonComment(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('delete-lesson-comment')
  async deleteLessonComment(
    @Req() req: RequestWithUser,
    @Body() body: { id: string },
  ) {
    return await this.lessonService.deleteLessonComment(body.id, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Get('get-lesson-comments/:id')
  async getLessonComments(
    @Param() param: { id: string },
  ): Promise<LessonComment[]> {
    return await this.lessonService.getLessonComments(param.id);
  }
}
