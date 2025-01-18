import apiClient from "./api.service"

const USER_BASE = '/users'

export const getMyDetails = () => {
    return apiClient.get(`${USER_BASE}/my-details`)
}

export const updateMyDetails = (data: { email: string, phone_number: string, first_name: string, last_name: string, profile_pic: string | null}) => {
    return apiClient.post(`${USER_BASE}/my-details`, data)
}

export const updateUserPassword = (data: { password: string, old_password: string, confirm_password: string}) => {
    const { password, confirm_password, old_password } = data
    if (password !== confirm_password) {
        throw new Error('Passwords do not match.')
    }
    return apiClient.post(`${USER_BASE}/my-password`, { password, old_password})
}