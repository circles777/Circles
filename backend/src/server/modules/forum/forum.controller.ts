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
import { ForumService } from './forum.service';
import { Forum } from 'src/server/entities/forum.entity';

export type SaveForumProps = Omit<Forum, '_id'>;

@Controller('forum')
export class ForumController {
  constructor(private readonly forumService: ForumService) {}

  @UseGuards(JwtAuthGuard)
  @Post('save-forum')
  async saveForum(@Req() req: RequestWithUser, @Body() body: SaveForumProps) {
    return await this.forumService.saveForum(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('update-forum')
  async updateForum(@Req() req: RequestWithUser, @Body() body: Forum) {
    return await this.forumService.updateForum(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('delete-forum')
  async deleteForumOne(
    @Req() req: RequestWithUser,
    @Body() body: { id: string },
  ) {
    return await this.forumService.deleteForumOne(body.id, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Get('get-forum-one/:id')
  async getForumOne(
    //@Req() req: RequestWithUser,
    @Param('id') id: string,
  ) {
    return await this.forumService.getForumOne(id);
  }
}
