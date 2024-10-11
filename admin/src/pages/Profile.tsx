import {
  Avatar,
  Box,
  Button,
  Grid2,
  ThemeProvider,
  Typography,
} from '@mui/material'
import ProfileEditForm from '../components/Profile/EditProfile'
import '../components/Profile/Profile.css'
import pfp from '../assets/junmar.png'
import bottwave from '../assets/pigHead.svg'
import ReusableDialogBox from '../modals/ReusableDialogBox'
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike'
import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import theme from '../Theme'

const Profile = () => {
  const navigate = useNavigate()

  // State to manage the dialog box visibility
  const [openDialog, setOpenDialog] = useState(false)

  // Function to open the dialog
  const handleOpenDialog = () => {
    setOpenDialog(true)
  }

  // Function to close the dialog
  const handleCloseDialog = () => {
    setOpenDialog(false)
  }

  // Function to handle save action in the dialog
  const handleSave = () => {
    console.log('Saving pig data...')
    handleCloseDialog() // Close dialog after saving
  }

  const handleLogOut = () => {
    navigate('/login')
  }

  return (
    <ThemeProvider theme={theme}>
      <Grid2
        container
        spacing={{xs:0, md:5}}
        sx={{
          paddingX: { xs: 2, sm: 4, lg: 6, xl: 7 },
          paddingTop: 5,
          paddingBottom: { xs: 10 },
        }}
      >
        <Grid2 size={{ xs: 0, md: 2 }}></Grid2>
        <Grid2 size={{ xs: 12, md: 2 }} className="rightEnd">
          <Grid2 size={{ xs: 6, md: 6 }} className="right">
            <Avatar
              src={pfp}
              alt="Junmar"
              sx={{
                width: 'clamp(130px, 10vw, 180px)',
                height: 'clamp(130px, 10vw, 180px)',
                borderRadius: 3,
                border: '2px solid #11703b',
              }}
            />

            <Button variant="text" sx={{ color: '#11703b', marginTop: 1 }}>
              <Typography
                sx={{
                  fontWeight: 300,
                  fontSize: 'clamp(12px, 1vw + 3px, 16px)',
                }}
              >
                Change Profile Picture
              </Typography>
            </Button>
          </Grid2>

          <Grid2 size={{ xs: 6, md: 12 }}>
            <Button
              variant="outlined"
              sx={{
                color: '#11703b',
                marginTop: { xs: 2, md: 10 },
                border: '1px solid #11703b',
                '&:hover': {
                  backgroundColor: '#11703b',
                  color: 'white',
                },
              }}
              onClick={handleOpenDialog}
            >
              <Typography
                sx={{
                  fontWeight: 500,
                  fontSize: 'clamp(11px, 1vw + 3px, 16px)',
                }}
              >
                Change Password
              </Typography>
            </Button>
          </Grid2>
        </Grid2>

        <Grid2
          size={{ xs: 12, md: 5 }}
          className="edit"
          sx={{
            backgroundColor: 'white',
            borderStyle: { xs: 'none', md: 'solid' },
            padding: '20px 60px'
          }}
        >
          <Grid2>
            <Typography variant="h4" fontWeight={500}>
              Edit Profile
            </Typography>
          </Grid2>
          <Grid2 sx={{ paddingTop: 2 }}>
            <ProfileEditForm />
          </Grid2>
        </Grid2>

        <Grid2 size={{ xs: 12, md: 3 }}>
          <Grid2
            size={{ xs: 6, md: 12 }}
            className="right"
            textAlign={{ xs: 'center', md: 'start' }}
          >
            <Button
              variant="outlined"
              sx={{
                color: '#11703b',
                border: '1px solid #11703b',
                zIndex: 2,
                '&:hover': {
                  backgroundColor: '#11703b',
                  color: 'white',
                },
              }}
              onClick={handleLogOut}
            >
              <Typography
                sx={{
                  fontWeight: 500,
                  fontSize: 'clamp(11px, 1vw + 3px, 16px)',
                }}
              >
                Log out
              </Typography>
            </Button>
          </Grid2>
        </Grid2>

        <Box
          component="img"
          src={bottwave}
          alt="Huge Pig"
          className="responsiveImage"
          zIndex={-1}
          width={{md: 330, lg:400, xl: 650}}
          sx={{
            display: {
              xs: 'none',
              md: 'block',
            },
          }}
        />
      </Grid2>
      {/* ReusableDialogBox to be shown when openDialog is true */}
      {openDialog && (
        <ReusableDialogBox
          title="Change Password"
          description="Fill up the necessary information."
          formFields={[
            {
              placeholder: 'Old Password',
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: 'New Password',
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: 'Confirm Password',
              icon: <DirectionsBikeIcon />,
            },
          ]}
          onSave={handleSave} // Handle save action
          onCancel={handleCloseDialog} // Handle cancel action
          saveButtonText="Save"
          saveButtonColor="#11703b" // Green color for the save button
        />
      )}
    </ThemeProvider>
  )
}

export default Profile
