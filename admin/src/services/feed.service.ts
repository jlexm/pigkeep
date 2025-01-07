import apiClient from "./api.service";

const FEEDS_BASE = '/feeds';
const FEEDS_HISTORY_BASE = '/feed-history';

export const fetchFeedsByFarm = (farm_id: string) => {
    return apiClient.get(`${FEEDS_BASE}/farm/${farm_id}`)
}

export const fetchFeedsHistoryByFarm = (farm_id: string) => {
    return apiClient.get(`${FEEDS_HISTORY_BASE}/farm/${farm_id}`)
}