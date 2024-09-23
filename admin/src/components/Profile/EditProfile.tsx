import * as React from 'react';
import { TextField, Button, Grid2 } from '@mui/material';

interface ProfileEditFormProps {
  // Add any necessary props here (optional)
}

const ProfileEditForm: React.FC<ProfileEditFormProps> = () => {
  const [userName, setUserName] = React.useState('The Kraken'); // Default username
  const [firstName, setFirstName] = React.useState('Jun Mar'); // Default first name
  const [lastName, setLastName] = React.useState('Fajardo'); // Default last name
  const [address, setAddress] = React.useState('Cebu'); // Default address
  const [phoneNumber, setPhoneNumber] = React.useState('09toloDosBenteSinkoSanggatos'); // Default phone number

  const handleSubmit = () => {
    // Handle form submission logic here
    console.log(
      'Submitted data:',
      userName,
      firstName,
      lastName,
      address,
      phoneNumber
    ); // Example usage, replace with your logic
  };

  return (
    <Grid2 container size={12}>
      <Grid2>
        <TextField
          label="Email"
          value="teehee@gmail.com"
          fullWidth
          disabled
          margin="normal"
        />
        <TextField
          label="Username"
          value={userName}
          onChange={(e) => setUserName(e.target.value)}
          fullWidth
          margin="normal"
          placeholder="Enter your username"
        />
        <TextField
          label="First Name"
          value={firstName}
          onChange={(e) => setFirstName(e.target.value)}
          fullWidth
          margin="normal"
          placeholder="Enter your first name"
        />
        <TextField
          label="Last Name"
          value={lastName}
          onChange={(e) => setLastName(e.target.value)}
          fullWidth
          margin="normal"
          placeholder="Enter your last name"
        />
        <TextField
          label="Address"
          value={address}
          onChange={(e) => setAddress(e.target.value)}
          fullWidth
          margin="normal"
          placeholder="Enter your address"
        />
        <TextField
          label="Phone Number"
          value={phoneNumber}
          onChange={(e) => setPhoneNumber(e.target.value)}
          fullWidth
          margin="normal"
          placeholder="Enter your phone number"
        />
      </Grid2>

      <Grid2 size={12} sx={{ paddingTop: 3 }}>
        <Button
          variant="contained"
          onClick={handleSubmit}
          sx={{
            width: 180, 
            backgroundColor: '#11703b', 
          }}
        >
          Save
        </Button>
      </Grid2>
    </Grid2>
  );
};

export default ProfileEditForm;
