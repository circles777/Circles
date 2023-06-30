import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User, UserRole } from 'src/server/entities/user.entity';
import { SaveForumProps } from './forum.controller';
import { Circle } from 'src/server/entities/circle.entity';
import { University } from 'src/server/entities/university.entity';
import { Tag } from 'src/server/entities/tag.entity';
import { Forum } from 'src/server/entities/forum.entity';

@Injectable()
export class ForumService {
  constructor(
    @InjectModel(Circle.name)
    private readonly circleModel: Model<Circle>,

    @InjectModel(Forum.name)
    private readonly forumModel: Model<Forum>,

    @InjectModel(University.name)
    private readonly universityModel: Model<University>,

    @InjectModel(Tag.name)
    private readonly tagModel: Model<Tag>,

    @InjectModel(User.name)
    private readonly userModel: Model<User>,
  ) {}

  async saveForum(body: SaveForumProps, user: User): Promise<Forum> {
    const newForum = new this.forumModel({
      title: body.title,
      content: body.content,
      writer: user,
    });
    const savedForum = (await newForum.save()).toObject();
    return savedForum;
  }

  async updateForum(body: Forum, user: User): Promise<Forum> {
    const exsitedForum = await this.forumModel.findById(body._id);
    if (
      exsitedForum.writer !== user._id.toString() &&
      user.role !== UserRole.Author
    ) {
      throw new HttpException(
        "You don't have the right to update this forum.",
        HttpStatus.BAD_REQUEST,
      );
    }

    await this.forumModel.updateOne({ _id: body._id }, body);
    const updatedForum = (await this.forumModel.findById(body._id)).toObject();
    return updatedForum;
  }

  async getForumOne(id: string): Promise<Circle> {
    return (
      await (
        await await this.forumModel.findById(id)
      ).populate('writer', '', this.userModel)
    ).toObject();
  }

  async deleteForumOne(id: string, user: User): Promise<Forum> {
    const deletedForum = (await this.forumModel.findById(id)).toObject();
    if (
      user.role !== UserRole.Author &&
      deletedForum.writer !== user._id.toString()
    ) {
      throw new HttpException(
        "You don't have the right to delete this forum.",
        HttpStatus.BAD_REQUEST,
      );
    }
    await this.forumModel.deleteOne(deletedForum);
    return deletedForum;
  }
}
