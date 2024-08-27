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

@Injectable()
export class AuthGuard implements CanActivate {
  constructor(
    private reflector: Reflector,
    private readonly authSvc: AuthService
  ) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest()

    // get jwt token from headers
    const token = request.headers.authorization?.split(' ')[1]

    // decode token
    const decoded = await this.authSvc.verifyJWT(token)
    request.user = decoded // Attach decoded user information to the request

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
