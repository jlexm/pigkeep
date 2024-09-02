import { Body, Controller, Post, Req, UseGuards } from '@nestjs/common';
import { Request } from 'express';
import { AuthGuard } from 'src/auth/auth.guard';

@Controller('farm')
export class FarmController {
    
    @Post()
    @UseGuards(AuthGuard)
    async createFarm(@Req() req: Request, @Body() body : any){
        console.log(req.user)        
    }
}
