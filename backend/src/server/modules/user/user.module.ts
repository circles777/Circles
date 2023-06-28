import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { User, UserSchema } from '../../entities/user.entity';
import { UserController } from './user.controller';
import { UserService } from './user.service';
import { Tag, TagSchema } from 'src/server/entities/tag.entity';
import {
  University,
  UniversitySchema,
} from 'src/server/entities/university.entity';
import { EventTag, EventTagSchema } from 'src/server/entities/eventTag.entity';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: 'user', schema: UserSchema },
      { name: Tag.name, schema: TagSchema },
      { name: EventTag.name, schema: EventTagSchema },
      { name: University.name, schema: UniversitySchema },
      //{ name: Address.name, schema: AddressSchema },
    ]),
    /*MongooseModule.forFeatureAsync([
      {
        name: WordCard.name,
        useFactory: () => {
          const schema = WordCardSchema;
          schema.pre('remove', function () {
            WordCardSchema.find().remove();
          });
          return schema;
        },
      },
    ]),*/
  ],
  controllers: [UserController],
  providers: [UserService],
})
export class UserModule {}
