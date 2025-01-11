import apiClient from "./api.service"

const PEN_BASE = '/pens'

export const getAllPensByFarm = (farm_id: string) => {
  return apiClient.get(`${PEN_BASE}/farm/${farm_id}`)
}