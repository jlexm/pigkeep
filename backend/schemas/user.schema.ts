import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose'
import { Gender, Role } from 'constants/app.constant'
import { HydratedDocument } from 'mongoose'

export type UserDocument = HydratedDocument<User>

// this schema
// auto genertes id stored in _id.
// timestamps auto generetes created and updated fields.
@Schema({ timestamps: true })
export class User {
  @Prop({ required: true, maxlength: 50, unique: true })
  username: string

  @Prop({ required: true })
  password: string

  @Prop({ maxlength: 255 })
  email: string

  @Prop({ maxlength: 11 })
  phone_number: string

  @Prop({ maxlength: 255 })
  profile_pic: string

  @Prop({ enum: [Gender.Male, Gender.Female, Gender.Other] })
  gender: string

  @Prop({ required: true, maxlength: 100 })
  first_name: string

  @Prop({ required: true, maxlength: 100 })
  last_name: string

  @Prop({  default: null, ref: 'User', validate: { 
    validator: function (value: string | null) {
        return this.role_id === 4 && value
      },
      message: 'Caretaker requires to have user owner.'
    } 
  })
  user_owner: string | null

  @Prop({
    enum: [Role.Superadmin, Role.Admin, Role.Owner, Role.Caretaker],
    default: Role.Owner,
    required: true,
  })
  role_id: number // Reference to Role model
}

export const UserSchema = SchemaFactory.createForClass(User)
