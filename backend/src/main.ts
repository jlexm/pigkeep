import { NestFactory } from '@nestjs/core'
import { AppModule } from './app.module'
import { ValidationPipe } from '@nestjs/common'
import { CorsOptions } from '@nestjs/common/interfaces/external/cors-options.interface'

const PORT = process.env.APP_PORT || 3000

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { bufferLogs: true })

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
  await app.listen(PORT)

  console.log(`SERVER STARTED AT http://localhost:${PORT}`)
}
bootstrap()
