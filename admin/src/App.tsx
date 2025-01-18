import './App.css'
import { BrowserRouter as Router, Routes, Route, useLocation, useNavigate } from 'react-router-dom'
import Navbar from './Navbar'
import Home from './pages/Home'
import Records from './pages/Records'
import Events from './pages/Events'
import Disposal from './pages/Disposal'
import Caretaker from './pages/Caretaker'
import Profile from './pages/Profile'
import Login from './pages/Login'
import { useEffect, useState } from 'react'
import { getUserToken } from './services/auth.service'
import { ToastContainer } from 'react-toastify';
import { Box, CircularProgress, Typography } from '@mui/material';
import { fetchMyFarms, getSelectedFarm, setSelectedFarm } from './services/farm.service'

function App() {
  const location = useLocation();
  const navigate = useNavigate();
  const [isLoading, setIsLoading] = useState<boolean>(true);

  useEffect(() => {
    const token = getUserToken();
    if(!token) {
      navigate('/login')
    }else {
      // fetch all farms and set the default selected farm on first page load
      (async () => {
        const myFarms = await fetchMyFarms() as any
        const selectedFarm = getSelectedFarm() ?? myFarms[0]
        setSelectedFarm(selectedFarm)
      })()
    }
    setIsLoading(false);
  }, [])

  if(isLoading) {
    return (
      <Box
        display="flex"
        justifyContent="center"
        alignItems="center"
        height="100vh"
        flexDirection="column"
      >
        <CircularProgress />
        <Typography variant="h5" component="strong" style={{ marginTop: '20px' }} color="textPrimary">
          Loading...
        </Typography>
        <Typography variant="caption" component="strong" style={{ marginTop: '20px' }} color="textPrimary">
          Please wait patiently
        </Typography>
      </Box>
    );
  }

  return (
    <div>
      {location.pathname !== '/login' && <Navbar />}
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/home" element={<Home />} />
        <Route path="/records" element={<Records />} />
        <Route path="/events" element={<Events />} />
        <Route path="/disposal" element={<Disposal />} />
        <Route path="/caretaker" element={<Caretaker />} />
        <Route path="/profile" element={<Profile />} />
        <Route path="/login" element={<Login />} />
      </Routes>
      <ToastContainer />
    </div>
  )
}

function AppWrapper() {
  return (
    <Router>
      <App />
    </Router>
  );
}

export default AppWrapper;
