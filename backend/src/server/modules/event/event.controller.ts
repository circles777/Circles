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
import { Address } from 'src/server/entities/address.entitiy';

export type SaveEventProps = Omit<Event, '_id' | 'circle' | 'address'> &
  Omit<Address, '_id'> & { circleID: string };

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
    return await this.eventService.deleteEventOne(body.id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('get-event-one')
  async getCircleOne(
    @Req() req: RequestWithUser,
    @Body() body: { id: string },
  ) {
    return await this.eventService.getEventOne(body.id);
  }
}
