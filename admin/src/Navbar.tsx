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
import { getUserBasicInfo } from './services/auth.service'
import greenLogo from './assets/GreenLogo.png'

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
  const navigate = useNavigate()
  const [currUser, setCurrUser] = React.useState<any>()

  React.useEffect(() => {
    // Redirect to /home if no route matches
    if (location.pathname === '/') {
      navigate('/home')
    }
  }, [location.pathname, navigate])

  React.useEffect(() => {
    const user = getUserBasicInfo()
    setCurrUser(user);
  }, [])

  const handleOpenNavMenu = (event: React.MouseEvent<HTMLElement>) => {
    setAnchorElNav(event.currentTarget)
  }

  const handleCloseNavMenu = () => {
    setAnchorElNav(null)
  }

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
          maxWidth='xxl'
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
            <Box
              sx={{
                display: { xs: 'flex', sm: 'none' },
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
                }}
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
                sx={{ display: { xs: 'block', sm: 'block', md: 'none' } }}
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
                    display: { xs: 'none', sm: 'flex' },
                    alignItems: 'center',
                  }}
                >
                  <img
                    src={greenLogo}
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

            <Box
              sx={{
                display: { xs: 'none', sm: 'flex' },
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
                      location.pathname === page.path ? '#11703b' : 'black',
                    fontSize: { xs: '0.8rem', md: '1rem' },
                    fontWeight: location.pathname === page.path ? '600' : '400',
                    display: 'block',
                    borderBottom:
                      location.pathname === page.path
                        ? '3px solid #11703b'
                        : 'none',
                    textTransform: 'none',
                    '&:hover': {
                      color: '#11703b',
                    },
                  }}
                >
                  {page.name}
                </Button>
              ))}
            </Box>

            <Box
              sx={{
                display: 'flex',
                alignItems: 'center',
                backgroundColor: '#11703b',
                padding: '8px 12px',
                borderRadius: '10px',
                minWidth: { xs: '50px', md: 'auto' },
                maxWidth: { xs: '100px', md: '200px' },
              }}
            >
              <Typography
                sx={{
                  color: 'white',
                  marginRight: { xs: '5px', md: '8px' },
                  fontSize: { xs: '11px', md: '16px' },
                }}
              >
                {currUser?.first_name ?? '-'}
              </Typography>
              <Tooltip title="Profile">
                <IconButton onClick={handleProfileClick} sx={{ p: 0 }}>
                  <Avatar
                    alt="Profile"
                    src="src/assets/ProfileIcon.png"
                    sx={{
                      width: { xs: 18, sm: 25, md: 30 },
                      height: { xs: 20, sm: 27, md: 32 },
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
