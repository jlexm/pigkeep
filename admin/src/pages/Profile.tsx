import {
  Avatar,
  Box,
  Button,
  Grid2,
  ThemeProvider,
  Typography,
} from '@mui/material';
import ProfileEditForm from '../components/Profile/EditProfile';
import '../components/Profile/Profile.css';
import pfp from '../assets/junmar.png';
import bottwave from '../assets/pigHead.svg';
import ReusableDialogBox from '../modals/ReusableDialogBox';
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike';
import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import theme from '../Theme';
import {
  getMyDetails,
  updateMyDetails,
  updateUserPassword,
} from '../services/user.service';
import { getUserBasicInfo, setUserBasicInfo } from '../services/auth.service';
import { toast } from 'react-toastify';

const Profile = () => {
  const navigate = useNavigate();

  const [userData, setUserData] = useState<any>();
  const [savingUserLoading, setSavingUserLoading] = useState(false);
  const [passwordLoading, setPasswordLoading] = useState(false);
  const [passwordForm, setPasswordForm] = useState<{
    password: string;
    old_password: string;
    confirm_password: string;
  }>({ password: '', old_password: '', confirm_password: '' });

  // State to manage the dialog box visibility
  const [openDialog, setOpenDialog] = useState(false);

  useEffect(() => {
    loadUserDetails();
  }, []);

  const loadUserDetails = async () => {
    const userData: any = await getMyDetails();
    setUserData(userData);
  };

  const updateUserDetails = async (data: {
    email: string;
    first_name: string;
    last_name: string;
    phone_number: string;
  }) => {
    setSavingUserLoading(true);
    try {
      await new Promise((resolve) => {
        setTimeout(resolve, 1000);
      });
      await updateMyDetails(data);
      const localUserDetails = getUserBasicInfo();
      const { first_name, last_name, email, phone_number } = data;
      setUserBasicInfo({
        ...localUserDetails,
        first_name,
        last_name,
        email,
        phone_number,
      });
      loadUserDetails();
      toast.success('User data updated succesfully.');
    } catch (err) {
      console.log(err);
    }
    setSavingUserLoading(false);
  };

  const updatePassword = async () => {
    setPasswordLoading(true);
    try {
      await new Promise((resolve) => {
        setTimeout(resolve, 1000);
      });
      await updateUserPassword(passwordForm);

      loadUserDetails();
      toast.success('User data updated succesfully.');
      setPasswordForm({ old_password: '', password: '', confirm_password: '' });
      handleCloseDialog();
    } catch (err: any) {
      console.log(err.message);
      if (err.message === 'Passwords do not match.') toast.error(err.message);
    }
    setPasswordLoading(false);
  };

  // Function to open the dialog
  const handleOpenDialog = () => {
    setOpenDialog(true);
  };

  // Function to close the dialog
  const handleCloseDialog = () => {
    setOpenDialog(false);
  };

  const handleLogOut = () => {
    localStorage.clear();
    navigate('/login');
  };

  return (
    <ThemeProvider theme={theme}>
      <Grid2
        container
        spacing={{ xs: 0, md: 5 }}
        sx={{
          paddingX: { xs: 2, sm: 4, lg: 6, xl: 7 },
          paddingTop: 5,
          paddingBottom: { xs: 10 },
        }}
      >
        <Grid2 size={{ xs: 0, md: 2 }}></Grid2>
        <Grid2
          size={{ xs: 12, md: 2 }}
          className="rightEnd"
          sx={{ marginBottom: { xs: 3, md: 0 } }}
        >
          <Grid2 size={{ xs: 12, md: 12 }} className="right">
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

          <Grid2 size={{ xs: 12, md: 12 }}>
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
            padding: '20px 60px',
          }}
        >
          <Grid2>
            <Typography variant="h4" fontWeight={500}>
              Edit Profile
            </Typography>
          </Grid2>
          <Grid2 sx={{ paddingTop: 2 }}>
            <ProfileEditForm
              userData={userData}
              savingUserLoading={savingUserLoading}
              onSave={(data) => updateUserDetails(data)}
            />
          </Grid2>
        </Grid2>

        <Grid2 size={{ xs: 12, md: 3 }} sx={{ marginTop: { xs: 5, md: 0 } }}>
          <Grid2
            size={{ xs: 12, md: 12 }}
            textAlign={{ xs: 'center', md: 'start' }}
            paddingX={{ xs: 6, sm: 20, md: 0 }}
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
                width: { xs: '100%', md: 100, lg: 130 },
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
          width={{ md: 330, lg: 400, xl: 650 }}
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
          loading={passwordLoading}
          formFields={[
            {
              placeholder: 'Old Password',
              type: 'password',
              icon: <DirectionsBikeIcon />,
              value: passwordForm.old_password,
              onChange: (v) =>
                setPasswordForm((prev) => ({ ...prev, old_password: v })),
            },
            {
              placeholder: 'New Password',
              type: 'password',
              icon: <DirectionsBikeIcon />,
              value: passwordForm.password,
              onChange: (v) =>
                setPasswordForm((prev) => ({ ...prev, password: v })),
            },
            {
              placeholder: 'Confirm Password',
              type: 'password',
              icon: <DirectionsBikeIcon />,
              value: passwordForm.confirm_password,
              onChange: (v) =>
                setPasswordForm((prev) => ({ ...prev, confirm_password: v })),
            },
          ]}
          onSave={updatePassword} // Handle save action
          onCancel={handleCloseDialog} // Handle cancel action
          saveButtonText="Save"
          saveButtonColor="#11703b" // Green color for the save button
        />
      )}
    </ThemeProvider>
  );
};

export default Profile;
