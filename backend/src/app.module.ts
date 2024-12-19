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
import { FarmController } from './farm/farm.controller'
import { FarmService } from './farm/farm.service'
import { Farm, FarmSchema } from 'schemas/farm.schema'
import { PenController } from './pen/pen.controller'
import { PenService } from './pen/pen.service'
import { PigService } from './pig/pig.service'
import { PigController } from './pig/pig.controller'
import { FeedsController } from './feeds/feeds.controller'
import { FeedsService } from './feeds/feeds.service'
import { MedicineService } from './medicine/medicine.service'
import { MedicineController } from './medicine/medicine.controller'
import { EventsController } from './events/events.controller'
import { EventsService } from './events/events.service'
import { Pen, PenSchema } from 'schemas/pen.schema'
import { Feeds, FeedsSchema } from 'schemas/feeds.schema'
import { Medicine, MedicineSchema } from 'schemas/medicine.schema'
import { Pig, PigSchema } from 'schemas/pig.schema'
import { Events, EventsSchema } from 'schemas/events.schema'
import { DisposalService } from './disposal/disposal.service'
import { DisposalController } from './disposal/disposal.controller'
import { Disposal, DisposalSchema } from 'schemas/disposal.schema'
import { FeedHistoryController } from './feed-history/feed-history.controller'
import { FeedHistoryService } from './feed-history/feed-history.service'
import { FeedsHistory, FeedsHistorySchema } from 'schemas/feedsHistory.schema'
import { MedicineHistoryService } from './medicine-history/medicine-history.service'
import { MedicineHistoryController } from './medicine-history/medicine-history.controller'
import {
  MedicinesHistory,
  MedicinesHistorySchema,
} from 'schemas/medicinesHistory.schema'
import { PigEventService } from './pig-event/pig-event.service'
import { PigEventController } from './pig-event/pig-event.controller'
import { PigEvent, PigEventSchema } from 'schemas/pigEvent.schema'

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
    MongooseModule.forFeature([
      { name: User.name, schema: UserSchema },
      { name: UserRole.name, schema: UserRoleSchema },
      { name: Farm.name, schema: FarmSchema },
      { name: Pen.name, schema: PenSchema },
      { name: Feeds.name, schema: FeedsSchema },
      { name: Medicine.name, schema: MedicineSchema },
      { name: Pig.name, schema: PigSchema },
      { name: Events.name, schema: EventsSchema },
      { name: Disposal.name, schema: DisposalSchema },
      { name: FeedsHistory.name, schema: FeedsHistorySchema },
      { name: MedicinesHistory.name, schema: MedicinesHistorySchema },
      { name: PigEvent.name, schema: PigEventSchema },
    ]),
  ],
  controllers: [
    AppController,
    AuthController,
    UserController,
    FarmController,
    PenController,
    PigController,
    FeedsController,
    MedicineController,
    EventsController,
    DisposalController,
    FeedHistoryController,
    MedicineHistoryController,
    PigEventController,
  ],
  providers: [
    AppService,
    AuthService,
    UserService,
    FarmService,
    PenService,
    PigService,
    FeedsService,
    MedicineService,
    EventsService,
    DisposalService,
    FeedHistoryService,
    MedicineHistoryService,
    PigEventService,
  ],
})
export class AppModule {}
