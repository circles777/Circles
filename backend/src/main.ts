/* eslint-disable prettier/prettier */
import { NestFactory } from '@nestjs/core';
import { AppModule } from './server/app.module';
import { join } from 'path';
import { NestExpressApplication } from '@nestjs/platform-express';
import { configuration } from './config/configuration';
import next from 'next';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(
    AppModule,
    //{ cors: true },
    /*,
    new FastifyAdapter()
  {
    rawBody: true,
  }*/
  );
  /*
  if(process.env.NODE_ENV==="production"){
    app.use(mongoose.connect(process.env.MONGODB_URI))
  }*/
  if (configuration().NODE_ENV === 'development') {
    app.enableCors({
      origin: ['http://localhost:3000', 'http://localhost:8080'],
      //allowedHeaders: 'Origin, X-Requested-With, Content-Type, Accept',
      allowedHeaders: [
        'Origin',
        'X-Requested-With',
        'Content-Type',
        'Accept',
        'Authorization',
        '*',
      ],
      credentials: true,
    });
  } else if (configuration().NODE_ENV === 'production') {
    app.enableCors({
      //origin: '*',
      allowedHeaders: [
        'Origin',
        'X-Requested-With',
        'Content-Type',
        'Accept',
        'Authorization',
      ],
      credentials: true,
    }); // protection
  }
  //app.useStaticAssets(join(__dirname, './.next'));

  app.listen(process.env.PORT || 4000);

  //site.render();
}
bootstrap();
