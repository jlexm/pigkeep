import { BadRequestException, Body, ConflictException, Controller, Get, Param, Post, Put, Delete, UseGuards } from '@nestjs/common';
import { CreateDisposalDto, UpdateDisposalDto } from './disposal.dto';
import { DisposalService } from './disposal.service';
import { Roles } from 'src/auth/auth.decorator';
import { Role } from 'constants/app.constant';
import { AuthGuard } from 'src/auth/auth.guard';


@Controller('disposals')
export class DisposalController {
  constructor(private readonly disposalService: DisposalService) {}

  @Post()
  @Roles([Role.Superadmin])
  @UseGuards(AuthGuard)
  async createDisposal(@Body() createDisposalDto: CreateDisposalDto) {
    try {
      const newDisposal = await this.disposalService.createDisposal(createDisposalDto);
      return newDisposal;
    } catch (error) {
      if (error.code === 11000) {
        throw new ConflictException('Disposal already exists');
      }
      throw error;
    }
  }

  @Get(':id')
  async getDisposalById(@Param('id') id: string) {
    const disposal = await this.disposalService.getDisposalById(id);
    if (!disposal) {
      throw new BadRequestException('Disposal not found');
    }
    return disposal;
  }

  @Put(':id')
  async updateDisposal(@Param('id') id: string, @Body() updateDisposalDto: UpdateDisposalDto) {
    const updatedDisposal = await this.disposalService.updateDisposal(id, updateDisposalDto);
    if (!updatedDisposal) {
      throw new BadRequestException('Disposal not found');
    }
    return updatedDisposal;
  }

  @Delete(':id')
  async deleteDisposal(@Param('id') id: string) {
    const result = await this.disposalService.deleteDisposal(id);
    if (!result) {
      throw new BadRequestException('Disposal not found');
    }
    return { message: 'Disposal deleted successfully' };
  }

  @Get()
  async getAllDisposals() {
    return this.disposalService.getAllDisposals();
  }
}
