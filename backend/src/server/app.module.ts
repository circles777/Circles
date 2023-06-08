/* eslint-disable prettier/prettier */
import { MiddlewareConsumer, Module, RequestMethod } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config'; // to let nest realize development.env and production.env
import { configuration } from '../config/configuration';
import { MongooseModule } from '@nestjs/mongoose';
import { StripeModule } from './modules/stripe/stripe.module';
import { ServeStaticModule } from '@nestjs/serve-static';
//import { join } from 'path';
import { UserController } from './modules/user/user.controller';
import { UserService } from './modules/user/user.service';
import { UserModule } from './modules/user/user.module';
import { CorsMiddleware } from './middleware/cors.middleware';
import { AuthModule } from './modules/auth/auth.module';
import { LessonModule } from './modules/lesson/lesson.module';
import { join } from 'path';
import { FrontendMiddleware } from './middleware/frontend.middleware';
import { ViewModule } from './modules/view/view.module';
import { CircleModule } from './modules/circle/circle.module';
import { EventModule } from './modules/event/event.module';

@Module({
  imports: [
    ServeStaticModule.forRoot({
      rootPath: join(__dirname, '../client/.next'),
    }),

    ConfigModule.forRoot({
      envFilePath: `./src/config/env/${process.env.NODE_ENV}.env`,
      load: [configuration],
      isGlobal: true,
    }),
    // to use env variables, you should put ConfigModule first before using env variables
    MongooseModule.forRoot(
      configuration().NODE_ENV === 'production'
        ? configuration().MONGODB_URI
        : 'mongodb://localhost:27017/jael',
      { useNewUrlParser: true, useUnifiedTopology: true },
    ),
    StripeModule,
    UserModule,
    AuthModule,
    LessonModule,
    CircleModule,
    EventModule,
    ViewModule, //@Get(*) でサイトをレンダリングしているので最後におく
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {
  // cors問題解決のため(enableCorsがなぜか効かなかったから)
  /*configure(consumer: MiddlewareConsumer) {
    consumer
      .apply(CorsMiddleware)
      .forRoutes(configuration().NODE_ENV === 'development' ? '*' : '');
  }*/
  /*configure(frontEnd: MiddlewareConsumer) {
    frontEnd.apply(FrontendMiddleware).forRoutes({
      path: '/**', // For all routes
      method: RequestMethod.ALL, // For all methods
    });
  }*/
}
