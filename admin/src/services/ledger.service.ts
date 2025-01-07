import apiClient from "./api.service";

const LEDGER_BASE = '/ledgers';

export const fetchLedgers = (farm_id: string) => {
    return apiClient.get(`${LEDGER_BASE}/farm/${farm_id}`)
}