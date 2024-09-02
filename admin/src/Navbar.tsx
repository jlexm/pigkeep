import './Navbar.css';

const Navbar = () => {
  return (
    <nav className="navbar">
      <div className="navbar-logo">
        <img src="src/assets/GreenLogo.png" alt="Pigkeep Logo" />
        <span>PIGKEEP</span>
      </div>
      <ul className="navbar-links">
        <li className="nav-item active">Home</li>
        <li className="nav-item">Records</li>
        <li className="nav-item">Events</li>
        <li className="nav-item">Disposal</li>
        <li className="nav-item">Caretaker</li>
      </ul>
      <div className="navbar-profile">
        <span>Alexander</span>
        <img src="src/assets/ProfileIcon.png" alt="Profile" />
      </div>
    </nav>
  );
};

export default Navbar;
