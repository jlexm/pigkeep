import { Injectable } from '@nestjs/common'
import { InjectModel } from '@nestjs/mongoose'
import { Model } from 'mongoose'
import { User } from 'schemas/user.schema'
import { CreateUserDto, RegisterUserDto } from './user.dto'

@Injectable()
export class UserService {
  constructor(@InjectModel(User.name) private userModel: Model<User>) {}

  createUser(createUserDto: CreateUserDto) {
    const newUser = new this.userModel(createUserDto)
    newUser.save()
    return newUser.toObject()
  }

  registerUser(registerUserDto: RegisterUserDto) {
    const newUser = new this.userModel(registerUserDto)
    newUser.save()
    return newUser.toObject()
  }

  async getUser(filter: Partial<User>) {
    return this.userModel.findOne(filter).exec()
  }

  async getUserCredentials(username: string) {
    return this.userModel
      .findOne(
        { username: { $regex: new RegExp(`^${username}$`, 'i') } },
        {
          _id: 1,
          email: 1,
          password: 1,
          username: 1,
          role_id: 1,
          first_name: 1,
          last_name: 1,
        }
      )
      .exec()
  }
}
