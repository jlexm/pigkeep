import './Navbar.css';
import { Link, useLocation } from 'react-router-dom';

const Navbar = () => {
  const location = useLocation();

  return (
    <nav className="navbar">
      <div className="navbar-logo">
        <img src="src/assets/GreenLogo.png" alt="Pigkeep Logo" />
        <span>PIGKEEP</span>
      </div>
      <ul className="navbar-links">
        <li className={`nav-item ${location.pathname === '/' ? 'active' : ''}`}>
          <Link to="/" className="nav-link">Home</Link>
        </li>
        <li className={`nav-item ${location.pathname === '/records' ? 'active' : ''}`}>
          <Link to="/records" className="nav-link">Records</Link>
        </li>
        <li className={`nav-item ${location.pathname === '/events' ? 'active' : ''}`}>
          <Link to="/events" className="nav-link">Events</Link>
        </li>
        <li className={`nav-item ${location.pathname === '/disposal' ? 'active' : ''}`}>
          <Link to="/disposal" className="nav-link">Disposal</Link>
        </li>
        <li className={`nav-item ${location.pathname === '/caretaker' ? 'active' : ''}`}>
          <Link to="/caretaker" className="nav-link">Caretaker</Link>
        </li>
      </ul>
      <button className="navbar-profile">
        <span>Alexander</span>
        <img src="src/assets/ProfileIcon.png" alt="Profile" />
      </button>
    </nav>
  );
};

export default Navbar;
