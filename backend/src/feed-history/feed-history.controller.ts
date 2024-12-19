import { Body, Controller, Get, Param, Post, Query } from '@nestjs/common'
import { FeedHistoryService } from './feed-history.service'

@Controller('feed-history')
export class FeedHistoryController {
  constructor(private readonly feedHistoryService: FeedHistoryService) {}

  /* FEED SYNC */
  @Get('/syncable/:farm_id')
  //@UseGuards(AuthGuard) // Use to restrict to signed-in users only
  async getSyncableFeeds(
    @Param('farm_id') farmId,
    @Query('last_successful_read_sync') last_successful_read_sync
  ) {
    return await this.feedHistoryService.getAllSyncableFeedsHistory(
      farmId,
      last_successful_read_sync
    )
  }

  @Post('/syncable/:farm_id')
  //@UseGuards(AuthGuard) // Use to restrict to signed-in users only
  async syncFeeds(
    @Param('farm_id') farmId,
    @Body('feedsHistory') feeds: any[]
  ) {
    await this.feedHistoryService.syncFeedsHistory(farmId, feeds)
    return { success: true, message: 'Data synced!' }
  }
}
