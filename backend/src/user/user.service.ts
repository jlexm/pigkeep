import { Injectable } from '@nestjs/common'
import { InjectModel } from '@nestjs/mongoose'
import { Model } from 'mongoose'
import { User } from 'schemas/user.schema'
import { CreateUserDto } from './user.dto'

@Injectable()
export class UserService {
  constructor(@InjectModel(User.name) private userModel: Model<User>) {}

  createUser(createUserDto: CreateUserDto) {
    const newUser = new this.userModel(createUserDto)
    return newUser.save()
  }

  async getUser(filter: Partial<User>) {
    return this.userModel.findOne(filter).exec()
  }

  async getUserCredentials(username: string) {
    return this.userModel
      .findOne(
        { username },
        { _id: 0, email: 1, password: 1, username: 1, role_id: 1 }
      )
      .exec()
  }
}
