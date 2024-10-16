import React, { useState } from 'react'
import {
  Box,
  Container,
  Grid2,
  Typography,
  TextField,
  Button,
  IconButton,
  InputAdornment,
  FormControlLabel,
  Checkbox,
  ThemeProvider,
} from '@mui/material'
import { Visibility, VisibilityOff } from '@mui/icons-material'
import tl from '../assets/topLeft.svg'
import br from '../assets/bottomRight.svg'
import miniLogo from '../assets/miniLogo.svg'
import '../components/Login/Login.css'

import theme from '../Theme'
import { useNavigate } from 'react-router-dom'

const Login = () => {
  const navigate = useNavigate()
  const [showPassword, setShowPassword] = useState(false)
  const [rememberMe, setRememberMe] = useState(false)

  const handleClickShowPassword = () => {
    setShowPassword(!showPassword)
  }

  const handleRememberMeChange = (event: {
    target: { checked: boolean | ((prevState: boolean) => boolean) }
  }) => {
    setRememberMe(event.target.checked)
  }

  const handeLogIn = () => {
    navigate('/home')
  }

  return (
    <ThemeProvider theme={theme}>
      <Box
        component="img"
        src={tl}
        alt="topLeft"
        className="loginTopLeft"
        sx={{ width: { xs: 400, sm: 500, md: 550, lg: 590, xl: 690 } }}
      />
      <Box
        component="img"
        src={br}
        alt="bottomRight"
        className="loginBottRight"
        sx={{ width: { xs: 350, sm: 500, md: 510, lg: 610, xl: 660 } }}
      />

      <Grid2
        container
        size={12}
        
        sx={{ paddingX: { xs: 5, sm: 20 } }}
      >
        <Grid2
          container
          size={12}
          spacing={2}
          className="middle"
          sx={{
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'center',
            alignItems: 'center',
          }}
        >
          <Box
            component="img"
            src={miniLogo}
            alt="Huge Pig"
            className="minLog"
            sx={{ height: 60 }}
          />
          <Typography
            variant="h3"
            color="black"
            align="center"
            sx={{ fontWeight: 900 }}
          >
            Log In
          </Typography>

          <Grid2 container size={12} sx={{ maxWidth: 440, paddingX: 3 }}>
            <Typography variant="body1" color="black" align="center">
              Welcome back! Log in to your account to continue your pig farm
              management experience.
            </Typography>
          </Grid2>

          <Container className="container">
            {/* Username TextField */}
            <TextField
              fullWidth
              label="Username"
              variant="outlined"
              sx={{
                height: 'clamp(40px, 4vw, 60px)',
                marginBottom: { xs: '12px', lg: '1px' }, 
                '& .MuiInputBase-root': {
                  height: '45px',
                  '& input': {
                    padding: 0,
                  },
                },
                '& .MuiInputLabel-root': {
                  top: '-5px',
                },
              }}
              InputProps={{
                sx: {
                  padding: '5px 10px',
                },
              }}
            />

            {/* Password TextField with Eye Icon */}
            <TextField
              fullWidth
              label="Password"
              type={showPassword ? 'text' : 'password'}
              variant="outlined"
              sx={{
                height: 'clamp(40px, 4vw, 60px)',
                marginBottom: { md: '12px', lg: '1px' }, 
                '& .MuiInputBase-root': {
                  height: '45px',
                  '& input': {
                    padding: 0,
                  },
                },
                '& .MuiInputLabel-root': {
                  top: '-5px',
                },
              }}
              InputProps={{
                sx: {
                  padding: '5px 10px',
                },
                endAdornment: (
                  <InputAdornment position="end">
                    <IconButton
                      onClick={handleClickShowPassword}
                      edge="end"
                      aria-label="toggle password visibility"
                    >
                      {showPassword ? <VisibilityOff /> : <Visibility />}
                    </IconButton>
                  </InputAdornment>
                ),
              }}
            />

            <Grid2 container size={12}>
              <Grid2 container size={6} sx={{ alignItems: 'start' }}>
                <FormControlLabel
                  control={
                    <Checkbox
                      checked={rememberMe}
                      onChange={handleRememberMeChange}
                      color="success"
                    />
                  }
                  label={<Typography variant="body2">Remember me</Typography>}
                  sx={{
                    marginTop: 1,
                    alignSelf: 'flex-start',
                    color: 'black',
                    padding: 0,
                  }}
                />
              </Grid2>

              <Grid2
                container
                size={6}
                sx={{ alignItems: 'center', justifyContent: 'end' }}
              >
                <Button
                  variant="text"
                  sx={{ textTransform: 'none', color: '#11703b' }}
                >
                  <Typography variant="body2">Forgot password?</Typography>
                </Button>
              </Grid2>
            </Grid2>

            {/* Login Button */}
            <Button
              variant="contained"
              color="primary"
              fullWidth
              sx={{
                marginTop: 2,
                bgcolor: '#11703b',
                height: { xs: 35, sm: 40, md: 45 },
              }}
              onClick={handeLogIn}
            >
              <Typography
                sx={{
                  fontWeight: 500,
                  fontSize: 'clamp(11px, 1vw + 3px, 16px)',
                }}
              >
                Log in
              </Typography>
            </Button>
          </Container>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  )
}

export default Login
