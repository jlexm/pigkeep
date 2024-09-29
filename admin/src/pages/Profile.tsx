import { Avatar, Box, Button, Grid2 } from '@mui/material'
import ProfileEditForm from '../components/Profile/EditProfile'
import '../components/Profile/Profile.css'
import pfp from '../assets/junmar.png'
import bottwave from '../assets/bottwave.svg'
import ReusableDialogBox from '../modals/ReusableDialogBox'
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike'
import { useState } from 'react'
import { useNavigate } from 'react-router-dom'

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
    <>
      <Grid2 container size={12} spacing={5} sx={{ margin: 8 }}>
        <Grid2 size={{ xs: 0, lg: 2 }}></Grid2>
        <Grid2 size={{ xs: 12, lg: 2 }} className="rightEnd">
          <Grid2 size={{ xs: 6, lg: 6 }} className="right">
            <Avatar
              src={pfp} 
              alt="Junmar"
              sx={{
                width: 180,
                height: 180,
                borderRadius: 3,
                border: '2px solid #11703b',
              }}
            />

            <Button variant="text" sx={{ color: '#11703b', marginTop: 1 }}>
              Change Profile Picture
            </Button>
          </Grid2>
          <Grid2 size={{ xs: 6, lg: 12 }} className="right">
            <Button
              variant="outlined"
              sx={{
                color: '#11703b',
                marginTop: 10,
                border: '1px solid #11703b',
                '&:hover': {
                  backgroundColor: '#11703b',
                  color: 'white',
                },
              }}
              onClick={handleOpenDialog}
            >
              Change Password
            </Button>
          </Grid2>

          <Grid2 size={{ xs: 6, lg: 12 }} className="right">
            <Button
              variant="outlined"
              sx={{
                color: '#11703b',
                marginTop: 10,
                border: '1px solid #11703b',
                zIndex: 2, 
                '&:hover': {
                  backgroundColor: '#11703b',
                  color: 'white',
                },
              }}
              onClick={handleLogOut}
            >
              Log Out
            </Button>
          </Grid2>
        </Grid2>

        <Grid2
          size={{ xs: 12, lg: 5 }}
          className="edit"
          sx={{ backgroundColor: 'white' }}
        >
          <Grid2>
            <p className="margin0" style={{ paddingBottom: 20 }}>
              Edit Profile
            </p>
          </Grid2>
          <Grid2 sx={{ paddingTop: 2 }}>
            <ProfileEditForm />
          </Grid2>
        </Grid2>

        <Grid2 size={{ xs: 0, lg: 3 }}></Grid2>

        <Box className="bottgreen">
          <Box
            component="img"
            src={bottwave}
            alt="Huge Pig"
            className="responsiveImage"
            zIndex={-1}
          />
        </Box>
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
    </>
  )
}

export default Profile
