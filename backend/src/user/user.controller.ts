import {
  BadRequestException,
  Body,
  ConflictException,
  Controller,
  Get,
  Param,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common'
import { CreateUserDto, GetUserParamsDto, RegisterUserDto } from './user.dto'
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

  @Post('sign-up')
  async registerUser(@Body() registerUserDto: RegisterUserDto) {
    try {
      // get pass from payload
      const { password, confirm_password } = registerUserDto

      if (password !== confirm_password) {
        throw new BadRequestException('Passwords do not match')
      }

      // convert pass to hash pass for security purposes
      const hashedPassword = await this.authSvc.hashPassword(password)

      // call user service craete user
      const newUser = await this.userSvc.registerUser({
        ...registerUserDto,
        password: hashedPassword,
      })

      const token = this.authSvc.generateJWT({
        username: newUser.username,
        role_id: newUser.role_id,
      })
      // send new user info
      return { ...{ ...newUser, password: undefined }, token }
    } catch (error) {
      // catch errors such us duplicate username error
      if (error.code === 11000) {
        // Duplicate key error code
        throw new ConflictException('Username already taken')
      }
      throw error // Re-throw if it's not a duplicate key error
    }
  }

  @UseGuards(AuthGuard)
  @Get('my-details')
  async getMyUserDetails(@Req() req: { user: ReqUser }) {
    return await this.userSvc.getUserDetailsByUsername(req.user.username)
  }

  @UseGuards(AuthGuard)
  @Post('my-details')
  async updateMyDetails(@Req() req: { user: ReqUser }, @Body() body) {
    await this.userSvc.updateUserDetails(req.user.username, body)

    return { success: true, message: 'Updated!' }
  }

  @Get(':username')
  async getUser(@Param() getUserParamsDto: GetUserParamsDto) {
    return 'hello'
  }
}
