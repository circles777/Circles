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
import { EventService } from './event.service';
import { Event } from 'src/server/entities/event.entity';
import { EventTag } from 'src/server/entities/eventTag.entity';

export type SaveEventProps = Omit<Event, '_id'>;
export type SaveEventTagProps = Omit<EventTag, '_id'>;

@Controller('event')
export class EventController {
  constructor(private readonly eventService: EventService) {}

  @UseGuards(JwtAuthGuard)
  @Post('save-event')
  async saveCircle(@Req() req: RequestWithUser, @Body() body: SaveEventProps) {
    return await this.eventService.saveEvent(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('update-event')
  async updateCircle(@Req() req: RequestWithUser, @Body() body: Event) {
    return await this.eventService.updateEvent(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('delete-event')
  async deleteCircleOne(
    @Req() req: RequestWithUser,
    @Body() body: { id: string },
  ) {
    return await this.eventService.deleteEventOne(body.id, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Get('get-event-one/:id')
  async getCircleOne(@Req() req: RequestWithUser, @Param('id') id: string) {
    return await this.eventService.getEventOne(id);
  }

  @UseGuards(JwtAuthGuard)
  @Post('delete-event-tag')
  async deleteEventTag(
    @Req() req: RequestWithUser,
    @Body() body: { id: string },
  ) {
    return await this.eventService.deleteEventTag(body.id, req.user);
  }
}
