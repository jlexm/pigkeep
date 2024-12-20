// src/auth/jwt-auth.guard.ts
import {
  Injectable,
  CanActivate,
  ExecutionContext,
  ForbiddenException,
} from '@nestjs/common'
import { AuthService } from './auth.service'
import { Reflector } from '@nestjs/core'
import { Roles } from './auth.decorator'
import { InjectModel } from '@nestjs/mongoose'
import { Model } from 'mongoose'
import { User } from 'schemas/user.schema'
import { UserService } from 'src/user/user.service'

@Injectable()
export class AuthGuard implements CanActivate {
  constructor(
    private reflector: Reflector,
    private readonly authSvc: AuthService,
    private readonly userSvc: UserService
  ) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest()

    // get jwt token from headers
    const token = request.headers.authorization?.split(' ')[1]

    // decode token
    const decoded = await this.authSvc.verifyJWT(token)
    const userRecord = await this.userSvc.getUserCredentials(decoded.username)

    request.user = userRecord // Attach user information to the request

    // check role decorator
    const roles = this.reflector.get(Roles, context.getHandler())
    if (roles && !roles.includes(decoded.role_id)) {
      throw new ForbiddenException(
        'You do not have the required role to access this resource'
      )
    }

    return true
  }
}
