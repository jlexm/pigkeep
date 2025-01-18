import {
  Avatar,
  Box,
  Button,
  Grid2,
  IconButton,
  Modal,
  Stack,
  ThemeProvider,
  Typography,
} from '@mui/material';
import ProfileEditForm from '../components/Profile/EditProfile';
import '../components/Profile/Profile.css';
import pfp from '../assets/junmar.png';
import bottwave from '../assets/pigHead.svg';
import ReusableDialogBox from '../modals/ReusableDialogBox';
import LockPersonIcon from '@mui/icons-material/LockPerson';
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
import CloseIcon from '@mui/icons-material/Close';

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

  const [selectedProfile, setSelectedProfile] = useState<string>();
  const [isProfileSelectOpen, setIsProfileSelectOpen] = useState(false);
  const profileOptions = [
    'assets/icons/Farmer.png',
    'assets/userIcons/female.png',
    'assets/userIcons/male.png',
    'assets/userIcons/neutral.png',
  ];

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
      if (data.phone_number.length !== 11) {
        throw new Error('Phone number is invalid');
      }
      await updateMyDetails({
        ...data,
        profile_pic:
          (selectedProfile ? selectedProfile : userData.profile_pic) ?? null,
      });
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
    } catch (err: any) {
      console.log(err);
      toast.error(err.message);
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

  // open the dialog
  const handleOpenDialog = () => {
    setOpenDialog(true);
  };

  // close the dialog
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
              src={`src/${
                (selectedProfile ? selectedProfile : userData?.profile_pic) ??
                'assets/icons/Farmer.png'
              }`}
              alt="Junmar"
              sx={{
                width: 'clamp(130px, 10vw, 180px)',
                height: 'clamp(130px, 10vw, 180px)',
                borderRadius: 3,
                border: '2px solid #11703b',
              }}
            />

            <Button
              variant="text"
              sx={{ color: '#11703b', marginTop: 1 }}
              onClick={() => setIsProfileSelectOpen(true)}
            >
              <Typography
                sx={{
                  fontWeight: 300,
                  fontSize: 'clamp(12px, 1vw + 3px, 16px)',
                }}
              >
                Choose Profile Picture
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

      {/* when openDialog is true */}
      {openDialog && (
        <ReusableDialogBox
          title="Change Password"
          description="Fill up the necessary information."
          loading={passwordLoading}
          formFields={[
            {
              placeholder: 'Old Password',
              type: 'password',
              icon: <LockPersonIcon />,
              value: passwordForm.old_password,
              onChange: (v) =>
                setPasswordForm((prev) => ({ ...prev, old_password: v })),
            },
            {
              placeholder: 'New Password',
              type: 'password',
              icon: <LockPersonIcon />,
              value: passwordForm.password,
              onChange: (v) =>
                setPasswordForm((prev) => ({ ...prev, password: v })),
            },
            {
              placeholder: 'Confirm Password',
              type: 'password',
              icon: <LockPersonIcon />,
              value: passwordForm.confirm_password,
              onChange: (v) =>
                setPasswordForm((prev) => ({ ...prev, confirm_password: v })),
            },
          ]}
          onSave={updatePassword}
          onCancel={handleCloseDialog}
          saveButtonText="Save"
          saveButtonColor="#11703b"
        />
      )}
      <Modal open={isProfileSelectOpen}>
        <Box
          sx={{
            position: 'absolute',
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            width: 400,
            bgcolor: 'background.paper',
            boxShadow: 24,
            p: 4,
            borderRadius: '16px',
          }}
        >
          <Stack spacing={2} direction="row" justifyContent="center">
            <Typography variant="h6" component="h2" color="black">
              Select your new profile
            </Typography>
          </Stack>
          <Stack spacing={2} direction="row" justifyContent="center" p={4}>
            {profileOptions.map((opt, index) => (
              <Avatar
                onClick={() => {
                  setSelectedProfile(opt);
                  setIsProfileSelectOpen(false);
                }}
                key={index}
                src={`src/${opt}`}
                sx={{
                  width: 72,
                  height: 72,
                  cursor: 'pointer',
                  backgroundColor: 'whitesmoke',
                  border: `4px solid ${
                    (selectedProfile && selectedProfile === opt) ||
                    (!selectedProfile &&
                      userData &&
                      userData.profile_pic &&
                      userData.profile_pic === opt)
                      ? 'green'
                      : 'white'
                  }`,
                }}
              />
            ))}
          </Stack>
          <IconButton
            onClick={() => setIsProfileSelectOpen(false)}
            sx={{ position: 'absolute', top: 8, right: 8 }}
          >
            <CloseIcon />
          </IconButton>
        </Box>
      </Modal>
    </ThemeProvider>
  );
};

export default Profile;
