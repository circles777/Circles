import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { User, UserSchema } from 'src/server/entities/user.entity';
import { Tag, TagSchema } from 'src/server/entities/tag.entity';
import { EventController } from './event.controller';
import { EventService } from './event.service';
import { Event, EventSchema } from 'src/server/entities/event.entity';
import { Circle, CircleSchema } from 'src/server/entities/circle.entity';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Tag.name, schema: TagSchema },
      { name: Circle.name, schema: CircleSchema },
      { name: Event.name, schema: EventSchema },
      { name: User.name, schema: UserSchema },
    ]),
  ],
  controllers: [EventController],
  providers: [EventService],
})
export class EventModule {}
