import * as React from 'react'
import AppBar from '@mui/material/AppBar'
import Box from '@mui/material/Box'
import Toolbar from '@mui/material/Toolbar'
import IconButton from '@mui/material/IconButton'
import Typography from '@mui/material/Typography'
import Menu from '@mui/material/Menu'
import MenuIcon from '@mui/icons-material/Menu'
import Container from '@mui/material/Container'
import Avatar from '@mui/material/Avatar'
import Button from '@mui/material/Button'
import Tooltip from '@mui/material/Tooltip'
import { Link, useLocation, useNavigate } from 'react-router-dom'
import './Navbar.css'
import { MenuItem } from '@mui/material'
import { ThemeProvider } from '@emotion/react'
import theme from './Theme'

const pages = [
  { name: 'Home', path: '/home' },
  { name: 'Records', path: '/records' },
  { name: 'Events', path: '/events' },
  { name: 'Disposal', path: '/disposal' },
  { name: 'Caretaker', path: '/caretaker' },
]

const Navbar = () => {
  const [anchorElNav, setAnchorElNav] = React.useState<null | HTMLElement>(null)
  const location = useLocation()
  const navigate = useNavigate() // useNavigate hook to navigate programmatically

  const handleOpenNavMenu = (event: React.MouseEvent<HTMLElement>) => {
    setAnchorElNav(event.currentTarget)
  }

  const handleCloseNavMenu = () => {
    setAnchorElNav(null)
  }

  // Function to navigate to the profile page
  const handleProfileClick = () => {
    navigate('/profile')
  }

  return (
    <ThemeProvider theme={theme}>
      <AppBar
        position="static"
        sx={{ backgroundColor: '#FFFCFF', marginTop: '16px' }}
        elevation={0}
      >
        <Container
          maxWidth="xxl"
          sx={{
            paddingX: { xs: '16px', sm: 5 },
            marginLeft: 0,
            alignSelf: 'center',
          }}
        >
          <Toolbar
            disableGutters
            sx={{ justifyContent: 'space-between', alignItems: 'center' }}
          >
            {/* Mobile menu icon */}
            <Box
              sx={{
                display: { xs: 'flex', sm: 'none' }, // Visible on xs and sm, hidden on md and above
                flexGrow: 1,
                justifyContent: 'flex-start',
              }}
            >
              <IconButton
                size="large"
                aria-label="menu"
                onClick={handleOpenNavMenu}
                sx={{
                  color: '#11703b',
                  fontSize: { xs: '2rem', sm: '2.5rem' },
                  padding: 0,
                }} // Adjust the font size for different screen sizes
              >
                <MenuIcon sx={{ fontSize: { xs: '2rem', sm: '2.5rem' } }} />{' '}
              </IconButton>
              <Menu
                id="menu-appbar"
                anchorEl={anchorElNav}
                anchorOrigin={{ vertical: 'bottom', horizontal: 'left' }}
                keepMounted
                transformOrigin={{ vertical: 'top', horizontal: 'left' }}
                open={Boolean(anchorElNav)}
                onClose={handleCloseNavMenu}
                sx={{ display: { xs: 'block', sm: 'block', md: 'none' } }} // Hidden on md and above
              >
                {pages.map((page) => (
                  <MenuItem key={page.name} onClick={handleCloseNavMenu}>
                    <Link
                      to={page.path}
                      className="nav-link"
                      style={{ textDecoration: 'none' }}
                    >
                      <Typography textAlign="center" sx={{ color: '#222222' }}>
                        {page.name}
                      </Typography>
                    </Link>
                  </MenuItem>
                ))}
              </Menu>
            </Box>

            {/* Logo centered on md screens */}
            <Box
              sx={{
                flexGrow: { md: 1 },
                display: 'flex',
                justifyContent: { xs: 'start' },
              }}
            >
              <Link to="/home">
                <Box
                  sx={{
                    display: { xs: 'none', sm: 'flex' }, // Hidden on xs and sm, shown on md and larger
                    alignItems: 'center',
                  }}
                >
                  <img
                    src="src/assets/GreenLogo.png"
                    alt="Pigkeep Logo"
                    style={{ width: 40, marginRight: 8 }}
                  />
                  <Typography
                    variant="h6"
                    noWrap
                    sx={{
                      fontFamily: 'poppins',
                      fontWeight: 900,
                      color: 'black',
                      textDecoration: 'none',
                      paddingLeft: 1,
                    }}
                  >
                    PIGKEEP
                  </Typography>
                </Box>
              </Link>
            </Box>

            {/* Desktop menu */}
            <Box
              sx={{
                display: { xs: 'none', sm: 'flex' }, // Only visible on md and larger
                justifyContent: 'end',
                paddingRight: { xs: 6, sm: 'none' },
                flexGrow: 1,
              }}
            >
              {pages.map((page) => (
                <Button
                  key={page.name}
                  component={Link}
                  to={page.path}
                  sx={{
                    marginLeft: { xs: 0.5, md: 1.5 },
                    my: 2,
                    color:
                      location.pathname === page.path ? '#11703b' : 'black', // Green text for the selected page
                    fontSize: { xs: '0.8rem', md: '1rem' }, // Responsive font size
                    fontWeight: location.pathname === page.path ? '600' : '400', // Font weight for current page
                    display: 'block',
                    borderBottom:
                      location.pathname === page.path
                        ? '3px solid #11703b'
                        : 'none', // Underline the current page
                    textTransform: 'none', // Prevent text from being transformed to uppercase
                    '&:hover': {
                      color: '#11703b', // Hover color for the page text
                    },
                  }}
                >
                  {page.name}
                </Button>
              ))}
            </Box>

            {/* Profile */}
            <Box
              sx={{
                display: 'flex',
                alignItems: 'center',
                backgroundColor: '#11703b',
                padding: '8px 12px', // Adjusted padding
                borderRadius: '10px',
                minWidth: { xs: '50px', md: 'auto' }, // Responsive min width
                maxWidth: { xs: '100px', md: '200px' }, // Responsive max width
              }}
            >
              <Typography
                sx={{
                  color: 'white',
                  marginRight: { xs: '5px', md: '8px' },
                  fontSize: { xs: '11px', md: '16px' }, // Responsive font size
                }}
              >
                Alexander
              </Typography>
              <Tooltip title="Profile">
                <IconButton onClick={handleProfileClick} sx={{ p: 0 }}>
                  <Avatar
                    alt="Profile"
                    src="src/assets/ProfileIcon.png"
                    sx={{
                      width: { xs: 18, sm: 25, md: 30 }, // Responsive width
                      height: { xs: 20, sm: 27, md: 32 }, // Responsive height
                    }}
                  />
                </IconButton>
              </Tooltip>
            </Box>
          </Toolbar>
        </Container>
      </AppBar>
    </ThemeProvider>
  )
}

export default Navbar
