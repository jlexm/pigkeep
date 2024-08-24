import {
  Body,
  ConflictException,
  Controller,
  Get,
  Post,
  UseGuards,
} from '@nestjs/common'
import { CreateUserDto } from './user.dto'
import { UserService } from './user.service'
import { AuthService } from 'src/auth/auth.service'
import { Roles } from 'src/auth/auth.decorator'
import { Role } from 'constants/app.constant'
import { AuthGuard } from 'src/auth/auth.guard'

@Controller('users')
export class UserController {
  constructor(
    private readonly userSvc: UserService,
    private readonly authSvc: AuthService
  ) {}

  @Post()
  @Roles([Role.Superadmin]) // remove if not needed, use to restrict role to this api
  @UseGuards(AuthGuard) // use to restrict to signed-in users only
  async createUser(@Body() createUserDto: CreateUserDto) {
    try {
      // get pass from payload
      const { password } = createUserDto

      // convert pass to hash pass for security purposes
      const hashedPassword = await this.authSvc.hashPassword(password)

      // call user service craete user
      const newUser = await this.userSvc.createUser({
        ...createUserDto,
        password: hashedPassword,
      })

      // send new user info
      return newUser
    } catch (error) {
      // catch errors such us duplicate username error
      if (error.code === 11000) {
        // Duplicate key error code
        throw new ConflictException('Username already taken')
      }
      throw error // Re-throw if it's not a duplicate key error
    }
  }

  @Get()
  async getUser() {
    return 'hello'
  }
}
