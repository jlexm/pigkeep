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
import { AccountCircle, Visibility, VisibilityOff } from '@mui/icons-material'
import tl from '../assets/topLeft.svg'
import br from '../assets/bottomRight.svg'
import miniLogo from '../assets/miniLogo.svg'
import '../components/Login/Login.css'

import theme from '../Theme'; // Import the theme

const Login = () => {
  const [showPassword, setShowPassword] = useState(false)
  const [rememberMe, setRememberMe] = useState(false)

  const handleClickShowPassword = () => {
    setShowPassword(!showPassword)
  }

  const handleRememberMeChange = (event) => {
    setRememberMe(event.target.checked)
  }

  return (
    <ThemeProvider  theme={theme}>
      <Box
        component="img"
        src={tl}
        alt="topLeft"
        className="loginTopLeft"
        sx={{ width: { xs: 0,md:400, lg: 520, xl: 560 } }}
      />
      <Box
        component="img"
        src={br}
        alt="bottomRight"
        className="loginBottRight"
        sx={{ width: { xs: 0,md:410, lg: 450, xl: 560 } }}
      />
      
      <Grid2 container size={12} spacing={1} >
        <Grid2
          container
          size={12}
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
            sx={{ fontWeight: 600 }}
          >
            Log In
          </Typography>

          <Grid2 container size={12} sx={{ maxWidth: 420 }}>
            <Typography variant='subtitle1' color="black" align="center">
              Welcome back! Log in to your account to continue your pig farm
              management experience.
            </Typography>
          </Grid2>

          <Container className="container">
            {/* Username TextField */}
            <TextField
              fullWidth
              margin="normal"
              label="Username"
              variant="outlined"
              sx={{
                height: 40,
                '& .MuiInputBase-root': {
                  height: '45px', // Adjust the input field height
                },
                '& .MuiInputLabel-root': {
                  top: '-5px', // Adjust label position
                },
              }}
              InputProps={{
                sx: {
                  padding: '5px 10px', // Adjust padding for smaller height
                },
              }}
            />

            {/* Password TextField with Eye Icon */}
            <TextField
              fullWidth
              margin="normal"
              label="Password"
              type={showPassword ? 'text' : 'password'}
              variant="outlined"
              sx={{
                height: 40,
                '& .MuiInputBase-root': {
                  height: '45px', // Adjust the input field height
                },
                '& .MuiInputLabel-root': {
                  top: '-5px', // Adjust label position
                },
              }}
              InputProps={{
                sx: {
                  padding: '5px 10px', // Adjust padding for smaller height
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
                  label="Remember Me"
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
                  Forgot password?
                </Button>
              </Grid2>
            </Grid2>

            {/* Login Button */}
            <Button
              variant="contained"
              color="primary"
              fullWidth
              sx={{ marginTop: 2, height: 50, bgcolor: '#11703b' }}
            >
              Log In
            </Button>
          </Container>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  )
}

export default Login
