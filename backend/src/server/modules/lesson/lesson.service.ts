import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Lesson } from 'src/server/entities/forum.entity';
import { LessonComment } from 'src/server/entities/forumComment.entity';
import { SentenceCard } from 'src/server/entities/sentenceCard.entity';
import { User, UserRole } from 'src/server/entities/user.entity';
import { UserFavoriteSentenceCard } from 'src/server/entities/userGoodForum.entitiy';
import { UserFavoriteWordCard } from 'src/server/entities/userFavoriteWord.entitiy';
import { WordCard } from 'src/server/entities/wordCard.entity';
import { PasswordOmitUser } from '../auth/local.strategy';
import {
  CreateLessonProps,
  CreateSentenceCardProps,
  CreateWordCardProps,
  DeleteSentenceCardProps,
  SaveLessonCommentDto,
} from './lesson.controller';

@Injectable()
export class LessonService {
  constructor(
    @InjectModel(Lesson.name)
    private readonly lessonModel: Model<Lesson>,

    @InjectModel(User.name)
    private readonly userModel: Model<User>,

    @InjectModel(WordCard.name)
    private readonly wordCardModel: Model<WordCard>,

    @InjectModel(SentenceCard.name)
    private readonly sentenceCardModel: Model<SentenceCard>,

    @InjectModel(UserFavoriteWordCard.name)
    private readonly userFavoriteWordCardModel: Model<UserFavoriteWordCard>,

    @InjectModel(UserFavoriteSentenceCard.name)
    private readonly userFavoriteSenteceCardModel: Model<UserFavoriteSentenceCard>,

    @InjectModel(LessonComment.name)
    private readonly lessonCommentModel: Model<LessonComment>,
  ) {}

  async createLesson(lesson: CreateLessonProps, user: PasswordOmitUser) {
    if (user.role !== 'author') {
      throw new HttpException(
        "You don't have right to create lessons.",
        HttpStatus.BAD_REQUEST,
      );
    }
    const { title } = lesson;
    const existsLesson = await this.lessonModel.findOne({ title });
    //console.log(existsUser);
    if (existsLesson) {
      console.log('already exists');
      throw new HttpException(
        'This title is already registered.',
        HttpStatus.BAD_REQUEST,
      );
    }
    const newLesson = await this.lessonModel.create(lesson);
    return await newLesson.save();
  }

  async updateLesson(body: Lesson, user: User): Promise<Lesson> {
    if (user.role !== 'author') {
      throw new HttpException(
        "You don't have right to update lessons.",
        HttpStatus.BAD_REQUEST,
      );
    }
    await this.lessonModel.updateOne({ _id: body._id }, body);
    return await (await this.lessonModel.findById(body._id)).toObject();
  }

  async getLessons(): Promise<Lesson[]> {
    const lessons = await this.lessonModel.find().exec();
    const res = lessons.map((l) => l.toObject());
    return res;
  }

  async getLessonDetail(id: string, user: User): Promise<Lesson> {
    let lesson = await this.lessonModel.findById(id).exec();
    lesson = lesson.toObject();
    const wordCards = await this.wordCardModel
      .find({
        lessons: { $eq: id },
      })
      .exec();
    const userFavoriteWordCards: UserFavoriteWordCard[] =
      await this.userFavoriteWordCardModel.find({ user: user._id }).exec();
    lesson.wordCards = wordCards.map((w) => {
      w = w.toObject(); // toObjectしないと、欲しい値が_doc:...下に表示されてしまい、うまく値を追加できない
      w.isUserFavorite = userFavoriteWordCards.some((u) => {
        const flag = u.word.equals(w._id); //ObjectId同士を比較するにはこの関数が必要
        return flag;
      });
      return w;
    });
    //console.log(lesson.wordCards);
    const sentenceCards = await this.sentenceCardModel
      .find({
        lesson: id,
      })
      .exec();
    lesson.sentenceCards = sentenceCards.map((s) => s.toObject());
    return lesson;
  }

  async createWordCard(
    wordCard: CreateWordCardProps,
    user: PasswordOmitUser,
  ): Promise<WordCard> {
    if (user.role !== 'author') {
      throw new HttpException(
        "You don't have right to create word cards.",
        HttpStatus.BAD_REQUEST,
      );
    }
    const { lessonId, ...restInfo } = wordCard;
    const existsWordCard = await this.wordCardModel.findOne({
      question: restInfo.question,
    });
    if (existsWordCard) {
      const res = existsWordCard.toObject();
      res.isDuplicate = true;
      res.lessons.push(lessonId);
      await this.wordCardModel.updateOne({ _id: res._id }, res);
      const isUserFavorite = await this.userFavoriteWordCardModel.findOne({
        user: user._id,
        word: res._id,
      });
      res.isUserFavorite = isUserFavorite ? true : false;
      return res;
    }
    const lesson = await this.lessonModel.findById(lessonId);
    const newWordCard = new this.wordCardModel(restInfo);
    newWordCard.lessons.push(lesson);
    newWordCard.author = user;
    return await newWordCard.save();
  }

  async createWordCardForPersonal(
    wordCard: Omit<WordCard, '_id'>,
    user: User,
  ): Promise<WordCard> {
    const existsWordCard = await this.wordCardModel.findOne({
      question: wordCard.question,
    });
    if (existsWordCard) {
      const res = existsWordCard.toObject();
      res.isDuplicate = true;
      const existsUserFavoriteWord =
        await this.userFavoriteWordCardModel.findOne({
          user: user._id,
          word: res._id,
        });
      if (existsUserFavoriteWord) {
        res.isUserFavorite = true;
        return res;
      }
      const newUserFavoriteWordCard = new this.userFavoriteWordCardModel();
      newUserFavoriteWordCard.user = user;
      newUserFavoriteWordCard.word = res._id;
      await newUserFavoriteWordCard.save();
      res.isUserFavorite = true;
      return res;
    }
    const newWordCard = new this.wordCardModel(wordCard);
    newWordCard.author = user;
    const createdWordCard = await (await newWordCard.save()).toObject();
    const newUserFavoriteWordCard = new this.userFavoriteWordCardModel();
    newUserFavoriteWordCard.user = user;
    newUserFavoriteWordCard.word = createdWordCard;
    await newUserFavoriteWordCard.save();
    createdWordCard.isUserFavorite = true;
    return createdWordCard;
  }

  async updateWordCard(body: WordCard, user: User): Promise<WordCard> {
    if (user.role !== 'author' && body.author !== user._id.toString()) {
      throw new HttpException(
        "You don't have right to update word cards.",
        HttpStatus.BAD_REQUEST,
      );
    }
    const existsWordCards = await this.wordCardModel.find({
      question: body.question,
    });
    if (
      existsWordCards.filter((e) => e._id.toString() !== body._id).length !== 0
    ) {
      throw new HttpException(
        'This question is duplicate, please add the word card',
        HttpStatus.FORBIDDEN,
      );
    }
    await this.wordCardModel.updateOne({ _id: body._id }, body).exec();
    return await (await this.wordCardModel.findById(body._id)).toObject();
  }

  async saveFavoriteWordCard(
    id: string,
    user: User,
  ): Promise<UserFavoriteWordCard | { word: string }> {
    const existsUserFavoriteWord = await this.userFavoriteWordCardModel.findOne(
      { user: user._id, word: id },
    );
    if (existsUserFavoriteWord) {
      await existsUserFavoriteWord.deleteOne();
      return { word: id }; // userがあるかどうかで消去したことを判別
    }
    const wordCard = await this.wordCardModel.findById(id).exec();
    if (!wordCard) {
      throw new HttpException('No word card.', HttpStatus.BAD_REQUEST);
    }
    const newUserFavoriteWordCard = new this.userFavoriteWordCardModel();
    newUserFavoriteWordCard.user = user;
    newUserFavoriteWordCard.word = wordCard._id;
    return await newUserFavoriteWordCard.save();
  }

  async getUserFavoriteWordCards(user: User): Promise<WordCard[]> {
    const wordCards = await this.userFavoriteWordCardModel
      .find({ user: user._id })
      .populate('word', '', this.wordCardModel)
      .exec();
    const favoriteWords: WordCard[] = wordCards.map((w) => {
      w = w.toObject();
      w.word.isUserFavorite = true;
      return w.word;
    });
    return favoriteWords.sort((a, b) => {
      if (a.pattern < b.pattern) {
        return 1;
      } else {
        return -1;
      }
    });
  }

  async createSentenceCard(
    sentenceCard: CreateSentenceCardProps,
    user: User,
  ): Promise<SentenceCard> {
    if (user.role !== 'author') {
      throw new HttpException(
        "You don't have right to create sentence cards.",
        HttpStatus.BAD_REQUEST,
      );
    }
    const { lessonId, ...restInfo } = sentenceCard;
    const lesson = await this.lessonModel.findById(lessonId);
    const newSentenceCard = new this.sentenceCardModel(restInfo);
    newSentenceCard.lesson = lesson;
    newSentenceCard.author = user;
    return await newSentenceCard.save();
  }

  async updateSentenceCard(
    body: SentenceCard,
    user: User,
  ): Promise<SentenceCard> {
    if (user.role !== 'author') {
      throw new HttpException(
        "You don't have right to update sentence cards.",
        HttpStatus.BAD_REQUEST,
      );
    }
    await this.sentenceCardModel.updateOne({ _id: body._id }, body).exec();
    return await (await this.sentenceCardModel.findById(body._id)).toObject();
  }

  async deleteSentenceCard(body: DeleteSentenceCardProps, user: User) {
    const { id, lessonId } = body;
    if (user.role !== 'author') {
      throw new HttpException(
        "You don't have right to delete sentence cards.",
        HttpStatus.BAD_REQUEST,
      );
    }
    const sentenceCard = await this.sentenceCardModel.findById(id).exec();
    const deletedSentenceCard = sentenceCard.toObject();
    //relationを削除
    /*await this.lessonModel.updateOne(
      { _id: lessonId },
      { $pull: { sentenceCards: id } }, // sentenceCardsリストの該当分を取り除く
    );*/
    await this.sentenceCardModel.deleteOne(deletedSentenceCard);
    return deletedSentenceCard;
  }

  async saveLessonComment(
    body: SaveLessonCommentDto,
    user: User,
  ): Promise<LessonComment> {
    const { content, lessonId } = body;
    const newLessonComment = new this.lessonCommentModel();
    newLessonComment.content = content;
    newLessonComment.lesson = lessonId;
    newLessonComment.writer = user;
    const savedComment = await newLessonComment.save();
    return { ...savedComment.toObject(), writer: user };
  }

  async deleteLessonComment(id: string, user: User) {
    const lessonComment = await this.lessonCommentModel
      .findById(id)
      .populate('writer', '', this.userModel)
      .exec();
    if (!lessonComment) {
      throw new HttpException(
        'There is no comment with this id.',
        HttpStatus.BAD_REQUEST,
      );
    }
    const deletingComment = lessonComment.toObject();
    if (
      !(
        deletingComment.writer._id.equals(user._id) ||
        user.role === UserRole.Author
      )
    ) {
      throw new HttpException(
        "You don't have the right to delete this comment.",
        HttpStatus.BAD_REQUEST,
      );
    }
    await this.lessonCommentModel.deleteOne(deletingComment);
    return deletingComment;
  }

  async getLessonComments(id: string): Promise<LessonComment[]> {
    const lessonComments = await this.lessonCommentModel
      .find({ lesson: id })
      .populate('writer', '', this.userModel)
      .exec();
    return lessonComments.map((c) => c.toObject());
  }
}
