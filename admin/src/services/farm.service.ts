import apiClient from "./api.service"

const FARM_BASE = '/farms'

export const getSelectedFarm = () => {
  const farmSerial = localStorage.getItem('selected_farm')
  if(farmSerial) {
    return JSON.parse(farmSerial)
  }
  return null
}

export const setSelectedFarm = (farm: any) => {
  localStorage.setItem('selected_farm', JSON.stringify(farm))
}

export const fetchMyFarms = () => {
  return apiClient.get(`${FARM_BASE}/my-farms`)
}