import axios from 'axios';
import { getPigKeepAPIURL } from './environment.service';
import { toast } from 'react-toastify';
import { getUserToken } from './auth.service';


const PIG_KEEP_URL = getPigKeepAPIURL()

const apiClient = axios.create({
  baseURL: PIG_KEEP_URL, // Use environment variables
  timeout: 10000, // Optional timeout
  headers: {
    'Content-Type': 'application/json',
  },
});

// Request interceptor
apiClient.interceptors.request.use(
  (config) => {
    const token = getUserToken(); // Retrieve token from local storage
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Response interceptor
apiClient.interceptors.response.use(
  (response) => response.data,
  (error) => {
    if (error.response) {
      const errorMessage = error.response.data?.message || 'Something went wrong';
      toast.error(errorMessage); // Display the error message
    }
    return Promise.reject(error);
  }
);

export default apiClient;
