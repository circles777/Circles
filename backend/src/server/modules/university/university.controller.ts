import { Body, Controller, Get, Post, Req, UseGuards } from '@nestjs/common';
import { RequestWithUser } from '../auth/auth.controller';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { UniversityService } from './university.service';
import { University } from 'src/server/entities/university.entity';

export type SaveUniversityProps = Omit<University, '_id'>;

@Controller('university')
export class UniversityController {
  constructor(private readonly universityService: UniversityService) {}

  @UseGuards(JwtAuthGuard)
  @Post('save-university')
  async saveCircle(
    @Req() req: RequestWithUser,
    @Body() body: SaveUniversityProps,
  ) {
    return await this.universityService.saveUniversity(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('update-university')
  async updateCircle(@Req() req: RequestWithUser, @Body() body: University) {
    return await this.universityService.updateUniversity(body, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Post('delete-university')
  async deleteCircleOne(
    @Req() req: RequestWithUser,
    @Body() body: { id: string },
  ) {
    return await this.universityService.deleteUniversityOne(body.id, req.user);
  }

  @UseGuards(JwtAuthGuard)
  @Get('get-university-one')
  async getCircleOne(
    //@Req() req: RequestWithUser,
    @Body() body: { id: string },
  ) {
    return await this.universityService.getUniversityOne(body.id);
  }
}
