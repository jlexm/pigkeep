import apiClient from "./api.service"

const CARETAKER_BASE = '/users/manage/caretaker'

export const fetchCaretakers = () => {
  return apiClient.get(`${CARETAKER_BASE}`)
}