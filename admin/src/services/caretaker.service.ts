import apiClient from "./api.service"

const CARETAKER_BASE = '/users/manage/caretaker'

export const fetchCaretakers = () => {
  return apiClient.get(`${CARETAKER_BASE}`)
}

export const addCaretaker = (data: { username: string, phone_number: string, first_name: string, last_name: string, password: string }) => {
  return apiClient.post(`${CARETAKER_BASE}`, data)
}

export const updateCaretaker = (data: { username: string, phone_number: string, first_name: string, last_name: string, password: string }) => {
  return apiClient.patch(`${CARETAKER_BASE}`, data)
}