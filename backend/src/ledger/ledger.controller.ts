import { Body, Controller, Get, Param, Post, Query } from '@nestjs/common'
import { LedgerService } from './ledger.service'

@Controller('ledgers')
export class LedgerController {
  constructor(private readonly ledgerService: LedgerService) {}

  /* FEED SYNC */
  @Get('/syncable/:farm_id')
  //@UseGuards(AuthGuard) // Use to restrict to signed-in users only
  async getSyncableFeeds(
    @Param('farm_id') farmId,
    @Query('last_successful_read_sync') last_successful_read_sync
  ) {
    return await this.ledgerService.getAllSyncableLedgers(
      farmId,
      last_successful_read_sync
    )
  }

  @Post('/syncable/:farm_id')
  //@UseGuards(AuthGuard) // Use to restrict to signed-in users only
  async syncFeeds(@Param('farm_id') farmId, @Body('ledgers') ledgers: any[]) {
    await this.ledgerService.syncLedgers(farmId, ledgers)
    return { success: true, message: 'Data synced!' }
  }

  @Get('/farm/:farm_id')
  async getLedgers(@Param('farm_id') farmId) {
    return await this.ledgerService.getFarmLedgers(farmId)
  }
}
