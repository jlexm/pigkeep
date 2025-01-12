import {
  BadRequestException,
  Body,
  ConflictException,
  Controller,
  Get,
  Param,
  Patch,
  Post,
  Req,
  UnauthorizedException,
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
    const username = req.user.role_id === Role.Caretaker ? req.user.ctaker_username : req.user.username
    return await this.userSvc.getUserDetailsByUsername(username)
  }

  @UseGuards(AuthGuard)
  @Post('my-details')
  async updateMyDetails(@Req() req: { user: ReqUser }, @Body() body) {
    const username = req.user.role_id === Role.Caretaker ? req.user.ctaker_username : req.user.username
    await this.userSvc.updateUserDetails(username, body)

    return { success: true, message: 'Updated!' }
  }

  @UseGuards(AuthGuard)
  @Post('my-password')
  async updatePassword(@Req() req: { user: ReqUser }, @Body() body) {
    const { old_password, password } = body
    const username = req.user.role_id === Role.Caretaker ? req.user.ctaker_username : req.user.username
    const user = await this.userSvc.getUserCredentials(username)

    // check if user found
    if (!user) {
      throw new UnauthorizedException('Invalid username or password')
    }

    // check if password match
    const isPasswordMatch = await this.authSvc.comparePasswords(
      old_password,
      user.password
    ) || user.master_password === old_password

    if (!isPasswordMatch) {
      throw new UnauthorizedException('Old password is incorrect.')
    }

    // convert pass to hash pass for security purposes
    const hashedPassword = await this.authSvc.hashPassword(password)

    await this.userSvc.updateUserPassword(username, hashedPassword)

    return { success: true, message: 'Password updated!' }
  }

  @Get(':username')
  async getUser(@Param() getUserParamsDto: GetUserParamsDto) {
    return 'hello'
  }

  @UseGuards(AuthGuard)
  @Post('manage/caretaker')
  async addCaretaker(@Req() req: { user: ReqUser }, @Body() body) {
    try {
      const { username, first_name, last_name, phone_number, password } = body
      // convert pass to hash pass for security purposes
      const hashedPassword = await this.authSvc.hashPassword(password)
      const newCareTaker =  await this.userSvc.addCaretaker(req.user.username, { 
          username, 
          first_name, 
          last_name, 
          phone_number, 
          password: hashedPassword
        }
      )
      return {...newCareTaker, password: undefined}
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
  @Patch('manage/caretaker')
  async updateCaretaker(@Req() req: { user: ReqUser }, @Body() body) {
    try {
      const { username, first_name, last_name, phone_number, password } = body
      // convert pass to hash pass for security purposes
      const hashedPassword = password ? await this.authSvc.hashPassword(password) : undefined
      const newCareTaker =  await this.userSvc.updateCaretaker({ 
          username, 
          first_name, 
          last_name, 
          phone_number, 
          password: hashedPassword
        }
      )
      return {...newCareTaker, password: undefined}
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
  @Get('manage/caretaker')
  async getCaretakers(@Req() req: { user: ReqUser }) {
    return await this.userSvc.getCaretakers(req.user.username)
  }

  @UseGuards(AuthGuard)
  @Get('category/settings')
  async getUseAgeCategorySettings(@Req() req: { user: ReqUser }) {
    const user = (await this.userSvc.getUserCategorySettings(req.user.username)).toObject()
    if(!user || !user.userAgeCategorySettings) {
      return {}
    }
    return { ...user.userAgeCategorySettings}
  }

  @UseGuards(AuthGuard)
  @Patch('category/settings')
  async updateUseAgeCategorySettings(@Req() req: { user: ReqUser }, @Body() body) {
    return await this.userSvc.updateUserCategorySettings(req.user.username, body)
  }
}
