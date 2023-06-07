import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { WordCard, WordCardSchema } from 'src/server/entities/wordCard.entity';
import { User, UserSchema } from '../../entities/user.entity';
import { UserController } from './user.controller';
import { UserService } from './user.service';
import { Tag, TagSchema } from 'src/server/entities/tag.entity';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: 'user', schema: UserSchema },
      { name: Tag.name, schema: TagSchema },
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
