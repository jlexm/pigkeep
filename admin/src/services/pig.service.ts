import apiClient from "./api.service"

const PIG_BASE = '/pigs'

export const fetchAllFarmPigs = (farm_id: string) => {
  return apiClient.get(`${PIG_BASE}/farm/${farm_id}`)
}