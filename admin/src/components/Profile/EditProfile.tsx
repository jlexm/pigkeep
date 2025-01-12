import * as React from 'react';
import {
  TextField,
  Button,
  Grid2,
  ThemeProvider,
  Typography,
  CircularProgress,
} from '@mui/material';
import theme from '../../Theme';

interface ProfileEditFormProps {
  // Add any necessary props here (optional)
  userData?: {
    username: string;
    email: string;
    first_name: string;
    last_name: string;
    phone_number: string;
  };
  savingUserLoading?: boolean;
  onSave?: (data: {
    email: string;
    last_name: string;
    first_name: string;
    phone_number: string;
  }) => void;
}

const ProfileEditForm: React.FC<ProfileEditFormProps> = ({
  userData,
  savingUserLoading,
  onSave,
}) => {
  const [email, setEmail] = React.useState(''); // Default email
  const [userName, setUserName] = React.useState(''); // Default username
  const [firstName, setFirstName] = React.useState(''); // Default first name
  const [lastName, setLastName] = React.useState(''); // Default last name
  const [phoneNumber, setPhoneNumber] = React.useState(''); // Default phone number

  React.useEffect(() => {
    if (!userData) return;
    setEmail(userData.email);
    setUserName(userData.username);
    setFirstName(userData.first_name);
    setLastName(userData.last_name);
    setPhoneNumber(userData.phone_number);
  }, [userData]);

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container size={12}>
        <Grid2>
          <TextField
            label={
              <Typography
                variant="body1"
                sx={{ fontSize: 'clamp(14px, 1vw, 16px)', padding: 0 }}
              >
                Username
              </Typography>
            }
            disabled
            value={userName}
            onChange={(e) => setUserName(e.target.value)}
            fullWidth
            margin="normal"
            placeholder="Enter your username"
            sx={{
              height: 'clamp(35px, 5vw, 40px)',
              padding: 0,
              '& .MuiInputBase-root': {
                height: '100%',
              },
            }}
          />

          <TextField
            label={
              <Typography
                variant="body1"
                sx={{ fontSize: 'clamp(14px, 1vw, 16px)', padding: 0 }}
              >
                Email
              </Typography>
            }
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            fullWidth
            margin="normal"
            sx={{
              height: 'clamp(35px, 5vw, 40px)',
              padding: 0,
              '& .MuiInputBase-root': {
                height: '100%',
              },
            }}
          />

          <TextField
            label={
              <Typography
                variant="body1"
                sx={{ fontSize: 'clamp(14px, 1vw, 16px)', padding: 0 }}
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
              height: 'clamp(35px, 5vw, 40px)',
              padding: 0,
              '& .MuiInputBase-root': {
                height: '100%',
              },
            }}
          />

          <TextField
            label={
              <Typography
                variant="body1"
                sx={{ fontSize: 'clamp(14px, 1vw, 16px)', padding: 0 }}
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
              height: 'clamp(35px, 5vw, 40px)',
              padding: 0,
              '& .MuiInputBase-root': {
                height: '100%',
              },
            }}
          />

          <TextField
            label={
              <Typography
                variant="body1"
                sx={{ fontSize: 'clamp(14px, 1vw, 16px)', padding: 0 }}
              >
                Phone Number
              </Typography>
            }
            value={phoneNumber}
            onChange={(e) => setPhoneNumber(e.target.value)}
            fullWidth
            margin="normal"
            type="tel"
            slotProps={{ htmlInput: { maxLength: 11 } }}
            placeholder="Enter your phone number"
            sx={{
              height: 'clamp(35px, 5vw, 40px)',
              padding: 0,
              '& .MuiInputBase-root': {
                height: '100%',
              },
            }}
          />
        </Grid2>

        <Grid2 size={12} sx={{ paddingTop: 3 }}>
          <Button
            variant="contained"
            disabled={savingUserLoading}
            onClick={() => {
              onSave?.({
                email,
                first_name: firstName,
                last_name: lastName,
                phone_number: phoneNumber,
              });
            }}
            sx={{
              width: { xs: '100%', sm: '100%', md: 120, lg: 150 },
              height: { xs: 30, sm: 40, md: 45 },
              backgroundColor: '#11703b',
            }}
          >
            {savingUserLoading && (
              <CircularProgress size={20} sx={{ color: 'white', mr: 2 }} />
            )}
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
  );
};

export default ProfileEditForm;
