import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { User, UserSchema } from 'src/server/entities/user.entity';
import { Tag, TagSchema } from 'src/server/entities/tag.entity';
import { UniversityController } from './university.controller';
import { UniversityService } from './university.service';
import {
  University,
  UniversitySchema,
} from 'src/server/entities/university.entity';
import { Circle, CircleSchema } from 'src/server/entities/circle.entity';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Tag.name, schema: TagSchema },
      { name: University.name, schema: UniversitySchema },
      { name: Circle.name, schema: CircleSchema },
      { name: User.name, schema: UserSchema },
    ]),
  ],
  controllers: [UniversityController],
  providers: [UniversityService],
})
export class CircleModule {}
