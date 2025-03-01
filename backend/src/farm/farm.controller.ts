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
  Req,
} from '@nestjs/common'
import { CreateFarmDto, UpdateFarmDto } from './farm.dto'
import { FarmService } from './farm.service'
import { Roles } from 'src/auth/auth.decorator'
import { Role } from 'constants/app.constant'
import { AuthGuard } from 'src/auth/auth.guard'

@Controller('farms')
export class FarmController {
  constructor(private readonly farmService: FarmService) {}

  @Post()
  @Roles([Role.Superadmin])
  @UseGuards(AuthGuard)
  async createFarm(@Req() req: { user: ReqUser }, @Body() createFarmDto: any) {
    try {
      const { _id } = req.user
      const newFarm = await this.farmService.createFarm({
        ...createFarmDto,
        owner_id: _id,
      })
      return newFarm
    } catch (error) {
      if (error.code === 11000) {
        throw new ConflictException('Farm already exists')
      }
    }
  }

  @Post('my-farms')
  @UseGuards(AuthGuard)
  async createMyFarm(@Req() req: { user: ReqUser }, @Body() body: any) {
    const { _id } = req.user

    try {

      if(body.farm_name.length < 3) {
        throw new BadRequestException('Farm name too short.')
      }

      if(body.farm_address.length < 10) {
        throw new BadRequestException('Farm address too short.')
      }

      return await this.farmService.createFarm({ owner_id: _id, ...body })
    } catch (error) {
      if (error.code === 11000) {
        throw new ConflictException('Farm already exists')
      }
      throw error
    }
  }

  @Get('my-farms')
  @UseGuards(AuthGuard)
  async getUserFarms(@Req() req: { user: ReqUser }) {
    const { username } = req.user
    const farms = await this.farmService.getMyFarms(username)
    console.log(farms)
    return farms
  }

  @Get(':id')
  async getFarmById(@Param('id') id: string) {
    const farm = await this.farmService.getFarmById(id)
    if (!farm) {
      throw new BadRequestException('Farm not found')
    }
    return farm
  }

  @Put(':id')
  async updateFarm(
    @Param('id') id: string,
    @Body() updateFarmDto: UpdateFarmDto
  ) {
    const updatedFarm = await this.farmService.updateFarm(id, updateFarmDto)
    if (!updatedFarm) {
      throw new BadRequestException('Farm not found')
    }
    return updatedFarm
  }

  @Delete(':id')
  async deleteFarm(@Param('id') id: string) {
    const result = await this.farmService.deleteFarm(id)
    if (!result) {
      throw new BadRequestException('Farm not found')
    }
    return { message: 'Farm deleted successfully' }
  }

  @Get()
  async getAllFarms() {
    return this.farmService.getAllFarms()
  }
}
