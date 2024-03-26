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
import { CircleService } from './circle.service';
import { Tag } from 'src/server/entities/tag.entity';
import { Circle } from 'src/server/entities/circle.entity';

export type SaveCircleProps = Omit<Circle, '_id'>;

export type SaveTagProps = Omit<Tag, '_id'>;

@Controller('circle')
export class CircleController {
  constructor(private readonly circleService: CircleService) {}

  @UseGuards(JwtAuthGuard)
  @Post('save-circle')
  async saveCircle(@Req() req: RequestWithUser, @Body() body: SaveCircleProps) {
    return await this.circleService.saveCircle(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('update-circle')
  async updateCircle(
    @Req() req: RequestWithUser,
    @Body() body: Circle,
  ): Promise<Circle> {
    return await this.circleService.updateCircle(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('delete-circle')
  async deleteCircleOne(
    @Req() req: RequestWithUser,
    @Body() body: { id: string },
  ) {
    return await this.circleService.deleteCircleOne(body.id, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Get('get-circle-one/:id')
  async getCircleOne(
    //@Req() req: RequestWithUser,
    @Param('id') id: string,
  ) {
    return await this.circleService.getCircleOne(id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('get-circles')
  async getCircles(): Promise<Array<Circle>> {
    return await this.circleService.getCircles();
  }

  @UseGuards(JwtAuthGuard)
  @Post('confirm-circle')
  async confirmCircleOne(
    @Req() req: RequestWithUser,
    @Body() body: { id: string },
  ) {
    return await this.circleService.confirmCircle(body.id, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('/tag/save-tag')
  async saveTag(@Req() req: RequestWithUser, @Body() body: SaveTagProps) {
    return await this.circleService.saveTag(body);
  }

  @UseGuards(JwtAuthGuard)
  @Post('/tag/delete-tag')
  async deleteTag(@Req() req: RequestWithUser, @Body() body: { id: string }) {
    return await this.circleService.deleteTag(body.id, req.user);
  }
}
