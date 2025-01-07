import apiClient from "./api.service";

const PIG_EVENTS_BASE = '/pig-event';

export const fetchFarmPigEvents = (farm_id: string) => {
    return apiClient.get(`${PIG_EVENTS_BASE}/farm/${farm_id}`)
}