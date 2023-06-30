import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { User, UserSchema } from 'src/server/entities/user.entity';
import { Tag, TagSchema } from 'src/server/entities/tag.entity';
import { ForumController } from './forum.controller';
import { ForumService } from './forum.service';
import {
  University,
  UniversitySchema,
} from 'src/server/entities/university.entity';
import { Circle, CircleSchema } from 'src/server/entities/circle.entity';
import { Forum, ForumSchema } from 'src/server/entities/forum.entity';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Tag.name, schema: TagSchema },
      { name: University.name, schema: UniversitySchema },
      { name: Circle.name, schema: CircleSchema },
      { name: User.name, schema: UserSchema },
      { name: Forum.name, schema: ForumSchema },
    ]),
  ],
  controllers: [ForumController],
  providers: [ForumService],
})
export class ForumModule {}
