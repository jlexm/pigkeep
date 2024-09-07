import { BadRequestException, Body, ConflictException, Controller, Get, Param, Post, Put, Delete, UseGuards } from '@nestjs/common';
import { CreatePigDto, UpdatePigDto } from './pig.dto';
import { PigService } from './pig.service';
import { Roles } from 'src/auth/auth.decorator';
import { Role } from 'constants/app.constant';
import { AuthGuard } from 'src/auth/auth.guard';


@Controller('pigs')
export class PigController {
  constructor(private readonly pigService: PigService) {}

  @Post()
  @Roles([Role.Superadmin])
  @UseGuards(AuthGuard)
  async createPig(@Body() createPigDto: CreatePigDto) {
    try {
      const newPig = await this.pigService.createPig(createPigDto);
      return newPig;
    } catch (error) {
      if (error.code === 11000) {
        throw new ConflictException('Pig already exists');
      }
      throw error;
    }
  }

  @Get(':id')
  async getPigById(@Param('id') id: string) {
    const pig = await this.pigService.getPigById(id);
    if (!pig) {
      throw new BadRequestException('Pig not found');
    }
    return pig;
  }

  @Put(':id')
  async updatePig(@Param('id') id: string, @Body() updatePigDto: UpdatePigDto) {
    const updatedPig = await this.pigService.updatePig(id, updatePigDto);
    if (!updatedPig) {
      throw new BadRequestException('Pig not found');
    }
    return updatedPig;
  }

  @Delete(':id')
  async deletePig(@Param('id') id: string) {
    const result = await this.pigService.deletePig(id);
    if (!result) {
      throw new BadRequestException('Pig not found');
    }
    return { message: 'Pig deleted successfully' };
  }

  @Get()
  async getAllPigs() {
    return this.pigService.getAllPigs();
  }
}
