import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { User, UserSchema } from 'src/server/entities/user.entity';
import { Address, AddressSchema } from 'src/server/entities/address.entitiy';
import { Tag, TagSchema } from 'src/server/entities/tag.entity';
import { CircleController } from './circle.controller';
import { CircleService } from './circle.service';
import { Group, GroupSchema } from 'src/server/entities/group.entity';
import { Circle, CircleSchema } from 'src/server/entities/circle.entity';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Address.name, schema: AddressSchema },
      { name: Tag.name, schema: TagSchema },
      { name: Group.name, schema: GroupSchema },
      { name: Circle.name, schema: CircleSchema },
      { name: User.name, schema: UserSchema },
    ]),
  ],
  controllers: [CircleController],
  providers: [CircleService],
})
export class CircleModule {}
