import { Body, Controller, Get, Param, Post, Query } from '@nestjs/common'
import { MedicineHistoryService } from './medicine-history.service'

@Controller('medicine-history')
export class MedicineHistoryController {
  constructor(
    private readonly medicineHistoryService: MedicineHistoryService
  ) {}

  /* FEED SYNC */
  @Get('/syncable/:farm_id')
  //@UseGuards(AuthGuard) // Use to restrict to signed-in users only
  async getSyncableFeeds(
    @Param('farm_id') farmId,
    @Query('last_successful_read_sync') last_successful_read_sync
  ) {
    return await this.medicineHistoryService.getAllSyncableMedsHistory(
      farmId,
      last_successful_read_sync
    )
  }

  @Post('/syncable/:farm_id')
  //@UseGuards(AuthGuard) // Use to restrict to signed-in users only
  async syncFeeds(
    @Param('farm_id') farmId,
    @Body('medicinesHistory') feeds: any[]
  ) {
    await this.medicineHistoryService.syncMedsHistory(farmId, feeds)
    return { success: true, message: 'Data synced!' }
  }
}
