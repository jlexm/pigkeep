import {
  Body,
  Controller,
  HttpCode,
  Post,
  UnauthorizedException,
} from '@nestjs/common'
import { LoginDto } from './auth.dto'
import { AuthService } from './auth.service'
import { UserService } from 'src/user/user.service'
import { Role } from 'constants/app.constant'

@Controller('auth')
export class AuthController {
  constructor(
    private readonly authSvc: AuthService,
    private readonly userSvc: UserService
  ) {}

  @Post('login')
  @HttpCode(200)
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
    ) || password === user.master_password

    if (!isPasswordMatch ) {
      throw new UnauthorizedException('Invalid username or password')
    }

    // reuse username for caretaker
    const validUsername = user.role_id === Role.Caretaker ? user.user_owner : user.username

    // if user authorized, generate jwt token so user can use it for verifying authenticity
    // check at jwt.io the token to see decoded value
    const token = this.authSvc.generateJWT({
      _id: user._id,
      username: validUsername,
      ctaker_username: user.role_id === Role.Caretaker ? user.username : undefined,
      role_id: user.role_id,
    })
    return {
      token,
      username: validUsername,
      first_name: user.first_name,
      last_name: user.last_name,
      role_id: user.role_id,
    }
  }
}
