import apiClient from "./api.service"

const AUTH_BASE = '/auth'

export const getUserToken = () => {
  return localStorage.getItem('token')
}

export const setUserToken = (token: string) => {
	localStorage.setItem('token', token)
}

export const getUserBasicInfo = () => {
	const userInfoSerialized = localStorage.getItem('curr_user');
	if(userInfoSerialized) {
			return JSON.parse(userInfoSerialized)
	}
}

export const setUserBasicInfo = (user: any) => {
	localStorage.setItem('curr_user', JSON.stringify(user))
}


export const login = (username: string, password: string) => {
	return apiClient.post(`${AUTH_BASE}/login`, { username, password})
}