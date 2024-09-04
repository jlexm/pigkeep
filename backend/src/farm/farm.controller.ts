import {
  Body,
  ConflictException,
  Controller,
  Post,
  UseGuards,
} from '@nestjs/common'
import { AuthGuard } from 'src/auth/auth.guard'
import { CreateFarmDto } from './farm.dto'
import { FarmService } from './farm.service'

@Controller('farm')
export class FarmController {
  constructor(private readonly farmSvc: FarmService) {}

  @Post()
  @UseGuards(AuthGuard)
  async createFarm(@Body() createFarmDto: CreateFarmDto) {
    try {
      // get farm from payload
      const { farm_name } = createFarmDto

      // call farm service to create farm
      const newFarm = await this.farmSvc.createFarm({
        ...createFarmDto,
      })

      return newFarm
    } catch (error) {
      if (error.code === 11000) {
        throw new ConflictException('Farm Name already taken')
      }
      throw error
    }
  }
}
