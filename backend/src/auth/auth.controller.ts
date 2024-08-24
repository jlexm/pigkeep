import { Body, Controller, Post, UnauthorizedException } from '@nestjs/common'
import { LoginDto } from './auth.dto'
import { AuthService } from './auth.service'
import { UserService } from 'src/user/user.service'

@Controller('auth')
export class AuthController {
  constructor(
    private readonly authSvc: AuthService,
    private readonly userSvc: UserService
  ) {}

  @Post('login')
  async login(@Body() body: LoginDto) {
    const { username, password } = body
    const user = await this.userSvc.getUserCredentials(username)

    // check if user found
    if (!user) {
      throw new UnauthorizedException('Invalid username or password')
    }

    // check if password match
    const isPasswordMatch = await this.authSvc.comparePasswords(
      password,
      user.password
    )

    if (!isPasswordMatch) {
      throw new UnauthorizedException('Invalid username or password')
    }

    // if user authorized, generate jwt token so user can use it for verifying authenticity
    // check at jwt.io the token to see decoded value
    const token = this.authSvc.generateJWT({
      username: user.username,
      role_id: user.role_id,
    })
    return { token }
  }
}
