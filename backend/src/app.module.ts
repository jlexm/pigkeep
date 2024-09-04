import { Module } from '@nestjs/common'
import { MongooseModule } from '@nestjs/mongoose'
import { ConfigModule, ConfigService } from '@nestjs/config'

import { AppController } from './app.controller'
import { AppService } from './app.service'
import { AuthService } from './auth/auth.service'
import { AuthController } from './auth/auth.controller'
import { UserController } from './user/user.controller'
import { UserService } from './user/user.service'
import { User, UserSchema } from 'schemas/user.schema'
import { JwtModule } from '@nestjs/jwt'
import { UserRole, UserRoleSchema } from 'schemas/user-role.schema'
import { FarmController } from './farm/farm.controller';
import { FarmService } from './farm/farm.service';
import { Farm, FarmSchema } from 'schemas/farm.schema'
import { PenController } from './pen/pen.controller';
import { PenService } from './pen/pen.service';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    JwtModule,
    MongooseModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: async (configService: ConfigService) => {
        const uri = configService.get<string>('MONGO_DB_URI')
        return { uri } // Load the environment variable
      },
      inject: [ConfigService],
    }),
    MongooseModule.forFeature([{ name: User.name, schema: UserSchema }, { name: UserRole.name, schema: UserRoleSchema } , { name: Farm.name, schema: FarmSchema}]),
  ],
  controllers: [AppController, AuthController, UserController, FarmController, PenController],
  providers: [AppService, AuthService, UserService, FarmService, PenService],
})
export class AppModule {}
