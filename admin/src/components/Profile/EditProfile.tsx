import * as React from 'react'
import {
  TextField,
  Button,
  Grid2,
  ThemeProvider,
  Typography,
} from '@mui/material'
import theme from '../../Theme'

interface ProfileEditFormProps {
  // Add any necessary props here (optional)
}

const ProfileEditForm: React.FC<ProfileEditFormProps> = () => {
  const [userName, setUserName] = React.useState('The Kraken') // Default username
  const [firstName, setFirstName] = React.useState('Jun Mar') // Default first name
  const [lastName, setLastName] = React.useState('Fajardo') // Default last name
  const [address, setAddress] = React.useState('Cebu') // Default address
  const [phoneNumber, setPhoneNumber] = React.useState(
    '09toloDosBenteSinkoSanggatos'
  ) // Default phone number

  const handleSubmit = () => {
    // Handle form submission logic here
    console.log(
      'Submitted data:',
      userName,
      firstName,
      lastName,
      address,
      phoneNumber
    ) // Example usage, replace with your logic
  }

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container size={12}>
        <Grid2>
          <TextField
            label={
              <Typography
                variant="body1"
                sx={{ fontSize: 'clamp(14px, 1.5vw, 18px)' }}
              >
                Email
              </Typography>
            }
            value="teehee@gmail.com"
            fullWidth
            disabled
            margin="normal"
            sx={{
              height: 'clamp(35px, 5vw, 60px)',
              '& .MuiInputBase-root': {
                height: '100%',
              },
            }}
          />

          <TextField
            label={
              <Typography
                variant="body1"
                sx={{ fontSize: 'clamp(14px, 1.5vw, 18px)' }}
              >
                Username
              </Typography>
            }
            value={userName}
            onChange={(e) => setUserName(e.target.value)}
            fullWidth
            margin="normal"
            placeholder="Enter your username"
            sx={{
              height: 'clamp(35px, 5vw, 60px)',
              '& .MuiInputBase-root': {
                height: '100%',
              },
            }}
          />

          <TextField
            label={
              <Typography
                variant="body1"
                sx={{ fontSize: 'clamp(14px, 1.5vw, 18px)' }}
              >
                First Name
              </Typography>
            }
            value={firstName}
            onChange={(e) => setFirstName(e.target.value)}
            fullWidth
            margin="normal"
            placeholder="Enter your first name"
            sx={{
              height: 'clamp(35px, 5vw, 60px)',
              '& .MuiInputBase-root': {
                height: '100%',
              },
            }}
          />

          <TextField
            label={
              <Typography
                variant="body1"
                sx={{ fontSize: 'clamp(14px, 1.5vw, 18px)' }}
              >
                Last Name
              </Typography>
            }
            value={lastName}
            onChange={(e) => setLastName(e.target.value)}
            fullWidth
            margin="normal"
            placeholder="Enter your last name"
            sx={{
              height: 'clamp(35px, 5vw, 60px)',
              '& .MuiInputBase-root': {
                height: '100%',
              },
            }}
          />

          <TextField
            label={
              <Typography
                variant="body1"
                sx={{ fontSize: 'clamp(14px, 1.5vw, 18px)' }}
              >
                Address
              </Typography>
            }
            value={address}
            onChange={(e) => setAddress(e.target.value)}
            fullWidth
            margin="normal"
            placeholder="Enter your address"
            sx={{
              height: 'clamp(35px, 5vw, 60px)',
              '& .MuiInputBase-root': {
                height: '100%',
              },
            }}
          />

          <TextField
            label={
              <Typography
                variant="body1"
                sx={{ fontSize: 'clamp(14px, 1.5vw, 18px)' }}
              >
                Phone Number
              </Typography>
            }
            value={phoneNumber}
            onChange={(e) => setPhoneNumber(e.target.value)}
            fullWidth
            margin="normal"
            placeholder="Enter your phone number"
            sx={{
              height: 'clamp(35px, 5vw, 60px)',
              '& .MuiInputBase-root': {
                height: '100%',
              },
            }}
          />
        </Grid2>

        <Grid2 size={12} sx={{ paddingTop: 3 }}>
          <Button
            variant="contained"
            onClick={handleSubmit}
            sx={{
              width: { xs: 140, sm: 200, md: 120, lg: 150 },
              height: { xs: 30, sm: 40, md: 45 },
              backgroundColor: '#11703b',
            }}
          >
            <Typography
              sx={{
                fontWeight: 500,
                fontSize: 'clamp(11px, 1.1vw + 3px, 16px)',
              }}
            >
              Save
            </Typography>
          </Button>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  )
}

export default ProfileEditForm
