import { toast } from "react-toastify"
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

export const addFarm = (data: { farm_name: string, farm_address: string }) => {
  if(!data.farm_name || !data.farm_address) {
    toast.error('Farm name and address are required')
    return
  }
  if(data.farm_name.length < 3) {
    toast.error('Farm name must be at least 3 characters')
    return
  }
  if(data.farm_address.length < 10) {
    toast.error('Farm address must be at least 3 characters')
    return
  }
  return apiClient.post(`${FARM_BASE}/my-farms`, data)
}