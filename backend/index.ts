import { NestFactory } from '@nestjs/core';
import { ExpressAdapter } from '@nestjs/platform-express';
import * as express from 'express';
import * as functions from 'firebase-functions';
import { AppModule } from './src/app.module';
import { CorsOptions } from '@nestjs/common/interfaces/external/cors-options.interface';
import { ValidationPipe } from '@nestjs/common';
const expressServer = express();
const createFunction = async (expressInstance): Promise<void> => {
    const app = await NestFactory.create(
        AppModule,
        new ExpressAdapter(expressInstance),
    );

    // Enable CORS for all origins
    const corsOptions: CorsOptions = {
        origin: '*',
        methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
        preflightContinue: false,
        optionsSuccessStatus: 204,
    }
    app.enableCors(corsOptions)

    app.useGlobalPipes(
        new ValidationPipe({
        whitelist: true, // Strips properties that are not defined in the DTO
        forbidNonWhitelisted: true, // Throws an error if non-whitelisted properties are found
        transform: true, // Automatically transform payloads to DTO instances
        })
    )
    await app.init();
};
export const api = functions.https.onRequest(async (request, response) => {
    await createFunction(expressServer);
    expressServer(request, response);
});