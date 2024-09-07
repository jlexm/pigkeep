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
  } from '@nestjs/common';
  import { CreatePenDto, UpdatePenDto } from './pen.dto';
  import { PenService } from './pen.service';
  import { AuthService } from 'src/auth/auth.service'; // if you use auth in this controller
  import { Roles } from 'src/auth/auth.decorator'; // if you use roles
  import { Role } from 'constants/app.constant'; // if you use role constants
  import { AuthGuard } from 'src/auth/auth.guard'; // if you use an auth guard

  
  @Controller('pens')
  export class PenController {
    constructor(
      private readonly penService: PenService,
      private readonly authService: AuthService, // if auth service is required
    ) {}
  
    @Post()
    @Roles([Role.Superadmin]) // Remove if roles are not needed
    @UseGuards(AuthGuard) // Use to restrict to signed-in users only
    async createPen(@Body() createPenDto: CreatePenDto) {
      try {
        // Create the new pen
        const newPen = await this.penService.createPen(createPenDto);
        return newPen;
      } catch (error) {
        // Handle potential errors
        if (error.code === 11000) {
          throw new ConflictException('Pen already exists');
        }
        throw error;
      }
    }
  
    @Get(':id')
    async getPenById(@Param('id') id: string) {
      const pen = await this.penService.getPenById(id);
      if (!pen) {
        throw new BadRequestException('Pen not found');
      }
      return pen;
    }
  
    @Put(':id')
    async updatePen(
      @Param('id') id: string,
      @Body() updatePenDto: UpdatePenDto,
    ) {
      const updatedPen = await this.penService.updatePen(id, updatePenDto);
      if (!updatedPen) {
        throw new BadRequestException('Pen not found');
      }
      return updatedPen;
    }
  
    @Delete(':id')
    async deletePen(@Param('id') id: string) {
      const result = await this.penService.deletePen(id);
      if (!result) {
        throw new BadRequestException('Pen not found');
      }
      return { message: 'Pen deleted successfully' };
    }
  
    @Get()
    async getAllPens() {
      return this.penService.getAllPens();
    }
  }
  