import { BadRequestException, Body, ConflictException, Controller, Get, Param, Post, Put, Delete, UseGuards } from '@nestjs/common';
import { CreateEventsDto, UpdateEventsDto } from './events.dto';
import { EventsService } from './events.service';
import { Roles } from 'src/auth/auth.decorator';
import { Role } from 'constants/app.constant';
import { AuthGuard } from 'src/auth/auth.guard';


@Controller('events')
export class EventsController {
  constructor(private readonly eventsService: EventsService) {}

  @Post()
  @Roles([Role.Superadmin])
  @UseGuards(AuthGuard)
  async createEvent(@Body() createEventsDto: CreateEventsDto) {
    try {
      const newEvent = await this.eventsService.createEvent(createEventsDto);
      return newEvent;
    } catch (error) {
      if (error.code === 11000) {
        throw new ConflictException('Event already exists');
      }
      throw error;
    }
  }

  @Get(':id')
  async getEventById(@Param('id') id: string) {
    const event = await this.eventsService.getEventById(id);
    if (!event) {
      throw new BadRequestException('Event not found');
    }
    return event;
  }

  @Put(':id')
  async updateEvent(@Param('id') id: string, @Body() updateEventsDto: UpdateEventsDto) {
    const updatedEvent = await this.eventsService.updateEvent(id, updateEventsDto);
    if (!updatedEvent) {
      throw new BadRequestException('Event not found');
    }
    return updatedEvent;
  }

  @Delete(':id')
  async deleteEvent(@Param('id') id: string) {
    const result = await this.eventsService.deleteEvent(id);
    if (!result) {
      throw new BadRequestException('Event not found');
    }
    return { message: 'Event deleted successfully' };
  }

  @Get()
  async getAllEvents() {
    return this.eventsService.getAllEvents();
  }
}
