import { Controller, Get, Render, Req, Res } from '@nestjs/common';
import { AppService } from './app.service';
import { Response, Request } from 'express';
import next from 'next';
import { join } from 'path';
import { createServer } from 'http';
import { parse } from 'url';

@Controller()
export class AppController {
  /*@Get(['/', '/lessons', '/lessons/*', '/dictionary'])
  async serveNextApp(@Req() req: Request, @Res() res: Response) {
    const nextApp = next({
      dev: false,
      dir: join(__dirname, '..'),
    });
    const parsedUrl = parse(req.url, true);
    const { pathname, query } = parsedUrl;
    nextApp.render(req, res, pathname, query);
  }*/
  /*
  private server: any;
  private nextApp: any;
  
  constructor(private readonly appService: AppService) {
    this.nextApp = next({
      dev: false,
      dir: join(__dirname, '..'),
    });
    this.server = createServer((req, res) => this.handleRequest(req, res));
    this.nextApp.prepare().then(() => {
      //this.server.listen();
      this.server.listen(3002, () => {
        console.log('App listening on port 3002');
      });
    });
  }
  //@Get()
  private handleRequest(req, res) {
    const parsedUrl = parse(req.url, true);
    const { pathname, query } = parsedUrl;
    this.nextApp.render(req, res, pathname, query);
    //this.nextApp.render();
  }
  */
  /*
  @Get()
  @Render('index')
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  root() {}*/
}
