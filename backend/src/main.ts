import { NestFactory } from '@nestjs/core'
import { AppModule } from './app.module'
import { ValidationPipe } from '@nestjs/common'

const PORT = process.env.APP_PORT || 3000

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { bufferLogs: true })
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
