import { Avatar, Box, Button, Grid2 } from '@mui/material'
import ProfileEditForm from '../components/Profile/EditProfile'
import '../components/Profile/Profile.css'
import pfp from '../assets/junmar.png'
import bottwave from '../assets/bottwave.svg'

const Profile = () => {
  return (
    <Grid2 container size={12} sx={{ margin: 8 }}>
      <Grid2 size={1.75}></Grid2>
      <Grid2 size={1.75} className="rightEnd">
        <Grid2 size={12} className="right">
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
        <Grid2 size={12} className="right">
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
          >
            Change Password
          </Button>
        </Grid2>
      </Grid2>

      <Grid2 size={5} className="edit" sx={{ backgroundColor: 'white' }}>
        <Grid2>
          <p className="margin0" style={{ paddingBottom: 20 }}>
            Edit Profile
          </p>
        </Grid2>
        <Grid2 sx={{ paddingTop: 2 }}>
          <ProfileEditForm />
        </Grid2>
      </Grid2>

      <Grid2 size={3.5}></Grid2>

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
  )
}

export default Profile
