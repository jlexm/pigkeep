import { Reflector } from '@nestjs/core'
import { Role } from 'constants/app.constant'

export const Roles = Reflector.createDecorator<Role[]>()
