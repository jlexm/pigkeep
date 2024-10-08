import './App.css'
import { BrowserRouter as Router, Routes, Route, useLocation } from 'react-router-dom'
import Navbar from './Navbar'
import Home from './pages/Home'
import Records from './pages/Records'
import Events from './pages/Events'
import Disposal from './pages/Disposal'
import Caretaker from './pages/Caretaker'
import Profile from './pages/Profile'
import Login from './pages/Login'

function App() {
  const location = useLocation();

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
