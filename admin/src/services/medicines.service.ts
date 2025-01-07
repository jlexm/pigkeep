import apiClient from "./api.service";

const MEDICINE_BASE = '/medicines';
const MEDICINE_HISTORY_BASE = '/medicine-history';

export const fetchMedicineByFarm = (farm_id: string) => {
    return apiClient.get(`${MEDICINE_BASE}/farm/${farm_id}`)
}

export const fetchMedicineHistoryByFarm = (farm_id: string) => {
    return apiClient.get(`${MEDICINE_HISTORY_BASE}/farm/${farm_id}`)
}