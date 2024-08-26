// src/types/express.d.ts
import { Role } from 'constants/app.constant'
import * as express from 'express'

declare global {
  namespace Express {
    interface Request {
      user?: { username: string; role_id: Role; email?: string; phone_number } // Adjust `any` to the specific type of your user object
    }
  }
}
