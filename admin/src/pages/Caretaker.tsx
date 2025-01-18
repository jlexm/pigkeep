import { Box, Button, Grid2, ThemeProvider, Typography } from '@mui/material';
import CaretakerDataTable from '../components/Caretaker/CaretakerDataTable';
import ReusableDialogBox from '../modals/ReusableDialogBox';
import { useEffect, useState } from 'react';
import theme from '../Theme';
import {
  addCaretaker,
  fetchCaretakers,
  updateCaretaker,
} from '../services/caretaker.service';
import { toast } from 'react-toastify';
import { Lock, Person, Phone } from '@mui/icons-material';

const Caretaker = () => {
  const [addCaretakerForm, setAddCaretakerForm] = useState({
    username: '',
    first_name: '',
    last_name: '',
    phone_number: '',
    password: '',
    confirm_password: '',
  });
  // manage dialog box visibility
  const [openDialog, setOpenDialog] = useState(false);

  const [caretakers, setCaretakers] = useState<any[]>([]);
  useEffect(() => {
    loadCaretakers();
  }, []);

  const loadCaretakers = async () => {
    const res = (await fetchCaretakers()) as any;
    setCaretakers(res);
  };

  // open dialog
  const handleOpenDialog = () => {
    setOpenDialog(true);
  };

  // close dialog
  const handleCloseDialog = () => {
    setOpenDialog(false);
  };

  //save action in  dialog
  const handleSave = async () => {
    if (addCaretakerForm.phone_number.length !== 11) {
      toast.error('Phone number is invalid');
      return;
    }
    await addCaretaker(addCaretakerForm);
    toast.success('Caretaker added successfully!');
    await loadCaretakers();
    handleCloseDialog();
  };

  return (
    <ThemeProvider theme={theme}>
      <Grid2
        container
        size={12}
        spacing={2}
        sx={{
          paddingX: { xs: 2, sm: 4, lg: 6, xl: 7 },
          paddingY: { xs: 2, sm: 5 },
        }}
      >
        <Grid2
          container
          size={12}
          alignItems="center"
          justifyContent={{ xs: 'center', sm: 'start' }}
          flexDirection={{ xs: 'column', sm: 'row' }}
        >
          <Box>
            <Typography
              fontSize={'clamp(2rem, 5vw, 3rem)'}
              fontWeight={700}
              color="Black"
              textAlign={{ xs: 'center', sm: 'start' }}
            >
              Caretakers
            </Typography>
          </Box>
          <Box>
            <Button
              variant="contained"
              sx={{
                backgroundColor: '#11703b',
                '&:hover': { backgroundColor: '#117e4b' },
                width: { xs: 110, sm: 80, md: 90, lg: 100, xl: 110 },
                height: { xs: 35, sm: 40, md: 45 },
                borderRadius: 2,
                alignSelf: { xs: 'center', sm: 'flex-start' },
              }}
              onClick={handleOpenDialog}
            >
              <Typography
                sx={{
                  fontWeight: 500,
                  fontSize: 'clamp(11px, 1vw + 5px, 16px)',
                }}
              >
                Add
              </Typography>
            </Button>
          </Box>
        </Grid2>
        <Grid2 container size={12} className="responsiveTable">
          <CaretakerDataTable
            rows={caretakers}
            onCaretakerSave={async (caretaker) => {
              console.log('hey', caretaker);
              if (caretaker.phone_number.length !== 11) {
                toast.error('Phone number is invalid');
                throw new Error('Phone number is invalid');
              }
              await updateCaretaker(caretaker);
              toast.success('Caretaker updated successfully!');
              await loadCaretakers();
            }}
          />
        </Grid2>
      </Grid2>

      {/* when openDialog is true */}
      {openDialog && (
        <ReusableDialogBox
          title="Add Caretaker"
          description="Fill up the form to add a caretaker to your farm."
          formFields={[
            {
              placeholder: 'Username',
              type: 'text',
              value: addCaretakerForm.username,
              onChange: (v) => {
                setAddCaretakerForm({ ...addCaretakerForm, username: v });
              },
              icon: <Person />,
            },
            {
              placeholder: 'First Name',
              type: 'text',
              value: addCaretakerForm.first_name,
              onChange: (v) => {
                setAddCaretakerForm({ ...addCaretakerForm, first_name: v });
              },
              icon: <Person />,
            },
            {
              placeholder: 'Last Name',
              type: 'text',
              value: addCaretakerForm.last_name,
              onChange: (v) => {
                setAddCaretakerForm({ ...addCaretakerForm, last_name: v });
              },
              icon: <Person />,
            },
            {
              placeholder: 'Phone Number',
              type: 'text',
              value: addCaretakerForm.phone_number,
              slotProps: { htmlInput: { maxLength: 11 } },
              onChange: (v) => {
                setAddCaretakerForm({ ...addCaretakerForm, phone_number: v });
              },
              icon: <Phone />,
            },
            {
              placeholder: 'Password',
              type: 'password',
              value: addCaretakerForm.password,
              onChange: (v) => {
                setAddCaretakerForm({ ...addCaretakerForm, password: v });
              },
              icon: <Lock />,
            },
            {
              placeholder: 'Confirm Password',
              type: 'password',
              value: addCaretakerForm.confirm_password,
              onChange: (v) => {
                setAddCaretakerForm({
                  ...addCaretakerForm,
                  confirm_password: v,
                });
              },
              icon: <Lock />,
            },
          ]}
          onSave={handleSave}
          onCancel={handleCloseDialog}
          saveButtonText="Add"
          saveButtonColor="#11703b"
        />
      )}
    </ThemeProvider>
  );
};

export default Caretaker;
