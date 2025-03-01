import {
  BadRequestException,
  Body,
  ConflictException,
  Controller,
  Get,
  Param,
  Post,
  Put,
  Delete,
  UseGuards,
  Query,
} from '@nestjs/common'
import { CreatePigDto, UpdatePigDto } from './pig.dto'
import { PigService } from './pig.service'
import { Roles } from 'src/auth/auth.decorator'
import { Role } from 'constants/app.constant'
import { AuthGuard } from 'src/auth/auth.guard'
import { DateTime } from 'luxon'

@Controller('pigs')
export class PigController {
  constructor(private readonly pigService: PigService) {}

  @Post()
  @Roles([Role.Superadmin])
  @UseGuards(AuthGuard)
  async createPig(@Body() createPigDto: CreatePigDto) {
    try {
      const newPig = await this.pigService.createPig(createPigDto)
      return newPig
    } catch (error) {
      if (error.code === 11000) {
        throw new ConflictException('Pig already exists')
      }
      throw error
    }
  }

  @Get(':id')
  async getPigById(@Param('id') id: string) {
    const pig = await this.pigService.getPigById(id)
    if (!pig) {
      throw new BadRequestException('Pig not found')
    }
    return pig
  }

  @Put(':id')
  async updatePig(@Param('id') id: string, @Body() updatePigDto: UpdatePigDto) {
    const updatedPig = await this.pigService.updatePig(id, updatePigDto)
    if (!updatedPig) {
      throw new BadRequestException('Pig not found')
    }
    return updatedPig
  }

  @Delete(':id')
  async deletePig(@Param('id') id: string) {
    const result = await this.pigService.deletePig(id)
    if (!result) {
      throw new BadRequestException('Pig not found')
    }
    return { message: 'Pig deleted successfully' }
  }

  @Get('farm/:farm_id')
  async getAllPigs(@Param('farm_id') farm_id) {
    const pigs = await this.pigService.getAllPigs(farm_id)
    return pigs
  }

  /* PIG SYNC */
  @Get('/syncable/:farm_id')
  //@UseGuards(AuthGuard) // Use to restrict to signed-in users only
  async getSyncablePigs(
    @Param('farm_id') farmId,
    @Query('last_successful_read_sync') last_successful_read_sync
  ) {
    const data = await this.pigService.getAllSyncablePigs(
      farmId,
      last_successful_read_sync
    )
    return data
  }

  @Post('/syncable/:farm_id')
  //@UseGuards(AuthGuard) // Use to restrict to signed-in users only
  async syncPigs(@Param('farm_id') farmId, @Body('pigs') pigs: any[]) {
    pigs.map((pig) => {
      if (pig.pigNumber == 'P-006') console.log(pig)
      console.log(DateTime.fromISO(pig.updatedAt).toRelative())
    })
    await this.pigService.syncPigs(farmId, pigs)
    return { success: true, message: 'Data synced!' }
  }
}
