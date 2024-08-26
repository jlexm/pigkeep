import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose'
import { Role } from 'constants/app.constant'
import { HydratedDocument } from 'mongoose'

export type UserRoleDocument = HydratedDocument<UserRole>

// this schema
// auto genertes id stored in _id.
// timestamps auto generetes created and updated fields.
@Schema({ timestamps: true })
export class UserRole {
  @Prop({
    required: true,
    enum: [Role.Superadmin, Role.Admin, Role.User],
    default: Role.User,
    unique: true,
  })
  role_id: number

  @Prop({ required: true })
  can_add_user: boolean

  @Prop({ required: true, maxlength: 255 })
  web_access: string
}

export const UserRoleSchema = SchemaFactory.createForClass(UserRole)
