import { Body, Controller, Get, Param, Post, Query } from '@nestjs/common'
import { PigEventService } from './pig-event.service'

@Controller('pig-event')
export class PigEventController {
  constructor(private readonly pigEventService: PigEventService) {}

  /* FEED SYNC */
  @Get('/syncable/:farm_id')
  //@UseGuards(AuthGuard) // Use to restrict to signed-in users only
  async getSyncableFeeds(
    @Param('farm_id') farmId,
    @Query('last_successful_read_sync') last_successful_read_sync
  ) {
    return await this.pigEventService.getAllSyncablePigEvents(
      farmId,
      last_successful_read_sync
    )
  }

  @Post('/syncable/:farm_id')
  //@UseGuards(AuthGuard) // Use to restrict to signed-in users only
  async syncFeeds(@Param('farm_id') farmId, @Body('pigEvents') feeds: any[]) {
    await this.pigEventService.syncPigEvents(farmId, feeds)
    return { success: true, message: 'Data synced!' }
  }

  @Get('/farm/:farm_id')
  async getFarmPigEvents(@Param('farm_id') farmId) {
    return await this.pigEventService.getFarmPigEvents(farmId)
  }
}
