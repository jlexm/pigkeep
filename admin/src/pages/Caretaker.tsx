// import { Box, Button, Grid2, ThemeProvider, Typography } from '@mui/material'
// import CaretakerDataTable from '../components/Caretaker/CaretakerDataTable'
// import ReusableDialogBox from '../modals/ReusableDialogBox'
// import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike'
// import { useState } from 'react'
// import theme from '../Theme'

// const Caretaker = () => {
//   // State to manage the dialog box visibility
//   const [openDialog, setOpenDialog] = useState(false)

//   // Function to open the dialog
//   const handleOpenDialog = () => {
//     setOpenDialog(true)
//   }

//   // Function to close the dialog
//   const handleCloseDialog = () => {
//     setOpenDialog(false)
//   }

//   // Function to handle save action in the dialog
//   const handleSave = () => {
//     console.log('Saving pig data...')
//     handleCloseDialog() // Close dialog after saving
//   }

//   return (
//     <ThemeProvider theme={theme}>
//       <Grid2
//         container
//         size={12}
//         spacing={2}
//         sx={{
//           paddingX: { xs: 2, sm: 4, lg: 6, xl: 7 },
//           paddingY: { xs: 2, sm: 5 },
//         }}
//       >
//         <Grid2 container size={12} alignItems='center'>
//           <Box>
//             <Typography variant="h3" fontWeight={700} color="Black" textAlign={{xs:'center', sm:'start'}}>
//               Caretakers
//             </Typography>
//           </Box>
//           <Box >
//             <Button
//               variant="contained"
//               sx={{
//                 backgroundColor: '#11703b',
//                 '&:hover': { backgroundColor: '#117e4b' },
//                 width: { xs: 70, sm: 80, md: 90, lg: 100, xl: 110 },
//                 height: { xs: 35, sm: 40, md: 45 },
//                 borderRadius: 2,
//               }}
//               onClick={handleOpenDialog}
//             >
//               <Typography
//                 sx={{
//                   fontWeight: 600,
//                   fontSize: 'clamp(11px, 1vw + 5px, 16px)',
//                 }}
//               >
//                 Add
//               </Typography>
//             </Button>
//           </Box>
//         </Grid2>
//         {/* <Grid2 container size={12} className="responsiveTable">
//           <CaretakerDataTable />
//         </Grid2> */}
//       </Grid2>
//       {/* ReusableDialogBox to be shown when openDialog is true */}
//       {openDialog && (
//         <ReusableDialogBox
//           title="Add Caretaker"
//           description="Fill up the form to add a caretaker to your farm."
//           formFields={[
//             {
//               placeholder: 'Email',
//               icon: <DirectionsBikeIcon />,
//             },
//             {
//               placeholder: 'Username',
//               icon: <DirectionsBikeIcon />,
//             },
//             {
//               placeholder: 'Phone Number',
//               icon: <DirectionsBikeIcon />,
//             },
//             {
//               placeholder: 'Password',
//               icon: <DirectionsBikeIcon />,
//             },
//             {
//               placeholder: 'Confirm Password',
//               icon: <DirectionsBikeIcon />,
//             },
//           ]}
//           onSave={handleSave} // Handle save action
//           onCancel={handleCloseDialog} // Handle cancel action
//           saveButtonText="Add"
//           saveButtonColor="#11703b" // Green color for the save button
//         />
//       )}
//     </ThemeProvider>
//   )
// }

// export default Caretaker

import { Box, Button, Grid2, ThemeProvider, Typography } from '@mui/material';
import CaretakerDataTable from '../components/Caretaker/CaretakerDataTable';
import ReusableDialogBox from '../modals/ReusableDialogBox';
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike';
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
  // State to manage the dialog box visibility
  const [openDialog, setOpenDialog] = useState(false);

  const [caretakers, setCaretakers] = useState<any[]>([]);
  useEffect(() => {
    loadCaretakers();
  }, []);

  const loadCaretakers = async () => {
    const res = (await fetchCaretakers()) as any;
    setCaretakers(res);
  };

  // Function to open the dialog
  const handleOpenDialog = () => {
    setOpenDialog(true);
  };

  // Function to close the dialog
  const handleCloseDialog = () => {
    setOpenDialog(false);
  };

  // Function to handle save action in the dialog
  const handleSave = async () => {
    await addCaretaker(addCaretakerForm);
    toast.success('Caretaker added successfully!');
    await loadCaretakers();
    handleCloseDialog(); // Close dialog after saving
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
              await updateCaretaker(caretaker);
              toast.success('Caretaker updated successfully!');
              await loadCaretakers();
            }}
          />
        </Grid2>
      </Grid2>
      {/* ReusableDialogBox to be shown when openDialog is true */}
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
          onSave={handleSave} // Handle save action
          onCancel={handleCloseDialog} // Handle cancel action
          saveButtonText="Add"
          saveButtonColor="#11703b" // Green color for the save button
        />
      )}
    </ThemeProvider>
  );
};

export default Caretaker;
