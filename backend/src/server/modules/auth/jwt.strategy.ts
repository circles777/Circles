// import先が'passport-local'では無い事に注意！
import { ExtractJwt, Strategy } from 'passport-jwt';
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PassportStrategy } from '@nestjs/passport';
import { AuthService, JwtPAYload } from './auth.service';
import { User } from '../../entities/user.entity';
import { configuration } from 'src/config/configuration';

// @description JWTの認証処理を行うクラス

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(private readonly authService: AuthService) {
    super({
      // Authorization bearerからトークンを読み込む関数を返す
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      // 有効期間を無視するかどうか
      ignoreExpiration: 3600,
      // envファイルから秘密鍵を渡す
      secretOrKey: configuration().jwt.secret || '93824',
    });
  }

  async validate(payload: JwtPAYload): Promise<JwtPAYload> {
    const user = await this.authService.jwtValidate(payload._id);
    if (!user) {
      throw new UnauthorizedException('user authorization failed');
    }
    return user;
  }
}
