import { Injectable } from '@nestjs/common'
import { InjectModel } from '@nestjs/mongoose'
import { Model } from 'mongoose'
import { User } from 'schemas/user.schema'
import { CreateUserDto, RegisterUserDto } from './user.dto'
import { Role } from 'constants/app.constant'

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

  getUser(filter: Partial<User>) {
    return this.userModel.findOne(filter).exec()
  }

  getUserDetailsByUsername(username: string) {
    return this.userModel.findOne({ username }).exec()
  }

  updateUserDetails(username: string, user: any) {
    return this.userModel.updateOne({ username }, { $set: { ...user } })
  }

  updateUserPassword(username: string, password: string) {
    return this.userModel.updateOne({ username }, { $set: { password } })
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
          user_owner: 1,
          master_password: 1,
          profile_pic: 1
        }
      )
      .exec()
  }

  async addCaretaker(user_owner: string, caretaker: any) {
    const newUser = new this.userModel({...caretaker, user_owner, role_id: Role.Caretaker})
    await newUser.save()
    return newUser.toObject()
  }

  async updateCaretaker(caretaker: any) {
    try {
      const updatedUser = await this.userModel.findOneAndUpdate(
        { username: caretaker.username }, // Filter by unique field
        { ...caretaker }, // Updated fields
        { new: true, runValidators: true } // Return updated document and validate schema
      );
      if (!updatedUser) {
        throw new Error('Caretaker not found');
      }
      return updatedUser.toObject();
    } catch (error) {
      console.error('Error updating caretaker:', error.message);
      throw error;
    }
  }

  async getCaretakers(user_owner: string) {
    return this.userModel.find({ user_owner: { $regex: new RegExp(`^${user_owner}$`, 'i') } }, {
      _id: 1,
      password: 1,
      username: 1,
      role_id: 1,
      first_name: 1,
      last_name: 1,
      phone_number: 1,
      profile_pic: 1
    }).exec()
  }

  async getUserCategorySettings(username: string) {
    return this.userModel.findOne({ username: { $regex: new RegExp(`^${username}$`, 'i') } }, {
      userAgeCategorySettings: 1,
    }).exec()
  }

  async updateUserCategorySettings(username: string, userAgeCategorySettings: any) {
    try {
      const updatedUser = await this.userModel.findOneAndUpdate(
        { username }, // Filter by unique field
        { userAgeCategorySettings }, // Updated fields
        { new: true, runValidators: true } // Return updated document and validate schema
      );
      if (!updatedUser) {
        throw new Error('Caretaker not found');
      }
      return updatedUser.toObject();
    } catch (error) {
      console.error('Error updating user', error.message);
      throw error;
    }
  }

}
