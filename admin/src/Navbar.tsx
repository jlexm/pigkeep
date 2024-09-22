import { Grid2 } from '@mui/material'
import './Navbar.css'
import { Link, useLocation, useNavigate } from 'react-router-dom'

const Navbar = () => {
  const location = useLocation()
  const navigate = useNavigate()

  const handleProfileClick = () => {
    navigate('/profile')
  }

  return (
    <Grid2>
      <nav className="navbar">
        <Link to="/" className="navbar-logo">
          <div className="logo-container">
            <img src="src/assets/GreenLogo.png" alt="Pigkeep Logo" />
            <span>PIGKEEP</span>
          </div>
        </Link>
        <ul className="navbar-links">
          <li
            className={`nav-item ${
              location.pathname === '/home' ? 'active' : ''
            }`}
          >
            <Link to="/home" className="nav-link">
              Home
            </Link>
          </li>
          <li
            className={`nav-item ${
              location.pathname === '/records' ? 'active' : ''
            }`}
          >
            <Link to="/records" className="nav-link">
              Records
            </Link>
          </li>
          <li
            className={`nav-item ${
              location.pathname === '/events' ? 'active' : ''
            }`}
          >
            <Link to="/events" className="nav-link">
              Events
            </Link>
          </li>
          <li
            className={`nav-item ${
              location.pathname === '/disposal' ? 'active' : ''
            }`}
          >
            <Link to="/disposal" className="nav-link">
              Disposal
            </Link>
          </li>
          <li
            className={`nav-item ${
              location.pathname === '/caretaker' ? 'active' : ''
            }`}
          >
            <Link to="/caretaker" className="nav-link">
              Caretaker
            </Link>
          </li>
        </ul>

        <button className="navbar-profile" onClick={handleProfileClick}>
          <span>Alexander</span>
          <img src="src/assets/ProfileIcon.png" alt="Profile" />
        </button>
      </nav>
    </Grid2>
  )
}

export default Navbar
