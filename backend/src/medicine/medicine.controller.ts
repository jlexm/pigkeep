import { BadRequestException, Body, ConflictException, Controller, Get, Param, Post, Put, Delete, UseGuards } from '@nestjs/common';
import { CreateMedicineDto, UpdateMedicineDto } from './medicine.dto';
import { MedicineService } from './medicine.service';
import { Roles } from 'src/auth/auth.decorator';
import { Role } from 'constants/app.constant';
import { AuthGuard } from 'src/auth/auth.guard';


@Controller('medicines')
export class MedicineController {
  constructor(private readonly medicineService: MedicineService) {}

  @Post()
  @Roles([Role.Superadmin])
  @UseGuards(AuthGuard)
  async createMedicine(@Body() createMedicineDto: CreateMedicineDto) {
    try {
      const newMedicine = await this.medicineService.createMedicine(createMedicineDto);
      return newMedicine;
    } catch (error) {
      if (error.code === 11000) {
        throw new ConflictException('Medicine already exists');
      }
      throw error;
    }
  }

  @Get(':id')
  async getMedicineById(@Param('id') id: string) {
    const medicine = await this.medicineService.getMedicineById(id);
    if (!medicine) {
      throw new BadRequestException('Medicine not found');
    }
    return medicine;
  }

  @Put(':id')
  async updateMedicine(@Param('id') id: string, @Body() updateMedicineDto: UpdateMedicineDto) {
    const updatedMedicine = await this.medicineService.updateMedicine(id, updateMedicineDto);
    if (!updatedMedicine) {
      throw new BadRequestException('Medicine not found');
    }
    return updatedMedicine;
  }

  @Delete(':id')
  async deleteMedicine(@Param('id') id: string) {
    const result = await this.medicineService.deleteMedicine(id);
    if (!result) {
      throw new BadRequestException('Medicine not found');
    }
    return { message: 'Medicine deleted successfully' };
  }

  @Get()
  async getAllMedicines() {
    return this.medicineService.getAllMedicine();
  }
}
