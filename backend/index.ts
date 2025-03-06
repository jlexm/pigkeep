import { NestFactory } from '@nestjs/core';
import { ExpressAdapter } from '@nestjs/platform-express';
import * as express from 'express';
import * as functions from 'firebase-functions';
import { AppModule } from './src/app.module';
import { ValidationPipe } from '@nestjs/common';
import { CorsOptions } from '@nestjs/common/interfaces/external/cors-options.interface';
import { setGlobalOptions } from 'firebase-functions/v2';

setGlobalOptions({
  maxInstances: 10,
  region: 'asia-southeast1',
  timeoutSeconds: 60,
  memory: '2GiB',
});

// Store the NestJS app globally to prevent reinitialization
let cachedNestApp = null;

const createNestServer = async () => {
  if (!cachedNestApp) {
    const expressInstance = express();
    const app = await NestFactory.create(
      AppModule,
      new ExpressAdapter(expressInstance)
    );

    // Enable CORS
    const corsOptions: CorsOptions = {
      origin: '*',
      methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
      preflightContinue: false,
      optionsSuccessStatus: 204,
    };
    app.enableCors(corsOptions);

    app.useGlobalPipes(
      new ValidationPipe({
        whitelist: true,
        forbidNonWhitelisted: true,
        transform: true,
      })
    );

    await app.init();
    cachedNestApp = expressInstance;
  }
  return cachedNestApp;
};

export const api = functions.https.onRequest(async (request, response) => {
  const appInstance = await createNestServer();
  appInstance(request, response);
});
