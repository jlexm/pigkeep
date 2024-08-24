import { Injectable, UnauthorizedException } from '@nestjs/common'
import { ConfigService } from '@nestjs/config'
import { JwtService } from '@nestjs/jwt'
import * as bcrypt from 'bcrypt'

@Injectable()
export class AuthService {
  constructor(
    private readonly jwtService: JwtService,
    private readonly configSvc: ConfigService
  ) {}

  async hashPassword(password: string): Promise<string> {
    const saltRounds = 10
    const salt = await bcrypt.genSalt(saltRounds)
    return bcrypt.hash(password, salt)
  }

  async comparePasswords(
    plainPassword: string,
    hashedPassword: string
  ): Promise<boolean> {
    return bcrypt.compare(plainPassword, hashedPassword)
  }

  generateJWT(
    payload: Object,
    secret: string = this.configSvc.get<string>('JWT_SECRET')
  ): string {
    const token = this.jwtService.sign(payload, { secret })
    return token
  }

  async verifyJWT(token?: string) {
    if (!token) {
      throw new UnauthorizedException('Token not provided')
    }

    try {
      const decoded = await this.jwtService.verifyAsync(token, {
        secret: this.configSvc.get<string>('JWT_SECRET'),
      })
      return decoded
    } catch (err) {
      throw new UnauthorizedException('Invalid or expired token')
    }
  }
}
