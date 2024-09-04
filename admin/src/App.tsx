import './App.css'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import Navbar from './Navbar'
import Home from './pages/Home'
import Records from './pages/Records'
import Events from './pages/Events'
import Disposal from './pages/Disposal'
import Caretaker from './pages/Caretaker'

function App() {
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/records" element={<Records />} />
        <Route path="/events" element={<Events />} />
        <Route path="/disposal" element={<Disposal />} />
        <Route path="/caretaker" element={<Caretaker />} />
      </Routes>
    </Router>
  )
}

export default App
