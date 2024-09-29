import { Button, Grid2 } from '@mui/material'
import CaretakerDataTable from '../components/Caretaker/CaretakerDataTable'
import '../components/Caretaker/Caretaker.css'
import ReusableDialogBox from '../modals/ReusableDialogBox';
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike';
import { useState } from 'react';

const Caretaker = () => {
    // State to manage the dialog box visibility
    const [openDialog, setOpenDialog] = useState(false);

    // Function to open the dialog
    const handleOpenDialog = () => {
      setOpenDialog(true);
    };
  
    // Function to close the dialog
    const handleCloseDialog = () => {
      setOpenDialog(false);
    };
  
    // Function to handle save action in the dialog
    const handleSave = () => {
      console.log('Saving pig data...');
      handleCloseDialog(); // Close dialog after saving
    };

  return (
    <>
    <Grid2 container size={12} spacing={2} className="paddingTop">
      <Grid2 container size={12} className="items">
        <p className="feedHistory">Caretakers</p>
        <Button
          variant="contained"
          sx={{
            backgroundColor: '#11703b',
            '&:hover': { backgroundColor: '#117e4b' },
            width: 90,
            height: 45,
            borderRadius: 2,
          }}
          onClick={handleOpenDialog}
        >
          Add
        </Button>
      </Grid2>
      <Grid2 container size={12} className='responsiveTable'>
        <CaretakerDataTable />
      </Grid2>
    </Grid2>
    {/* ReusableDialogBox to be shown when openDialog is true */}
    {openDialog && (
        <ReusableDialogBox
          title="Add Caretaker"
          description="Fill up the form to add a caretaker to your farm."
          formFields={[
            {
              placeholder: "Email",
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: "Username",
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: "Phone Number",
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: "Password",
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: "Confirm Password",
              icon: <DirectionsBikeIcon />,
            },
          ]}
          onSave={handleSave} // Handle save action
          onCancel={handleCloseDialog} // Handle cancel action
          saveButtonText="Add"
          saveButtonColor="#11703b" // Green color for the save button
        />
      )}
    </>
  )
}

export default Caretaker
