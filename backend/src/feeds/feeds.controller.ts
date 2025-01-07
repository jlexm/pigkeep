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
import { CreateFeedsDto, UpdateFeedsDto } from './feeds.dto'
import { FeedsService } from './feeds.service'
import { Roles } from 'src/auth/auth.decorator'
import { Role } from 'constants/app.constant'
import { AuthGuard } from 'src/auth/auth.guard'

@Controller('feeds')
export class FeedsController {
  constructor(private readonly feedsService: FeedsService) {}

  @Post()
  @Roles([Role.Superadmin])
  @UseGuards(AuthGuard)
  async createFeeds(@Body() createFeedsDto: CreateFeedsDto) {
    try {
      const newFeeds = await this.feedsService.createFeeds(createFeedsDto)
      return newFeeds
    } catch (error) {
      if (error.code === 11000) {
        throw new ConflictException('Feed already exists')
      }
      throw error
    }
  }

  @Get(':id')
  async getFeedsById(@Param('id') id: string) {
    const feeds = await this.feedsService.getFeedsById(id)
    if (!feeds) {
      throw new BadRequestException('Feed not found')
    }
    return feeds
  }

  @Put(':id')
  async updateFeeds(
    @Param('id') id: string,
    @Body() updateFeedsDto: UpdateFeedsDto
  ) {
    const updatedFeeds = await this.feedsService.updateFeeds(id, updateFeedsDto)
    if (!updatedFeeds) {
      throw new BadRequestException('Feed not found')
    }
    return updatedFeeds
  }

  @Delete(':id')
  async deleteFeeds(@Param('id') id: string) {
    const result = await this.feedsService.deleteFeeds(id)
    if (!result) {
      throw new BadRequestException('Feed not found')
    }
    return { message: 'Feed deleted successfully' }
  }

  @Get()
  async getAllFeeds() {
    return this.feedsService.getAllFeeds()
  }

  /* FEED SYNC */
  @Get('/syncable/:farm_id')
  //@UseGuards(AuthGuard) // Use to restrict to signed-in users only
  async getSyncableFeeds(
    @Param('farm_id') farmId,
    @Query('last_successful_read_sync') last_successful_read_sync
  ) {
    return await this.feedsService.getAllSyncableFeeds(
      farmId,
      last_successful_read_sync
    )
  }

  @Post('/syncable/:farm_id')
  //@UseGuards(AuthGuard) // Use to restrict to signed-in users only
  async syncFeeds(@Param('farm_id') farmId, @Body('feeds') feeds: any[]) {
    await this.feedsService.syncFeeds(farmId, feeds)
    return { success: true, message: 'Data synced!' }
  }

  @Get('/farm/:farm_id')
  async getFeedsByFarm(@Param('farm_id') farmId) {
    return await this.feedsService.getFeedsByFarmId(farmId)
  }
}
