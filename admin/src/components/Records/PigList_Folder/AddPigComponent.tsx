import React, { useState } from 'react'
import { Button, Grid2 } from '@mui/material'
import AddCircleIcon from '@mui/icons-material/AddCircle'
import ReusableDialogBox from '../../../modals/ReusableDialogBox'
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike'

export default function AddPigComp() {
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

  return (
    <>
      <Grid2 container size={12} className="addPig">
        <Grid2 size={{ xs: 12, lg: 4.5 }} className="textAlign-left">
          <span className="pigTotal">44</span>
        </Grid2>
        <Grid2 size={{ xs: 12, lg: 3.5 }} className="total">
          <span>
            Total <br />
            Living Pigs
          </span>
        </Grid2>
        <Grid2 size={{ xs: 12, lg: 4 }} className="addButton">
          <Button
            variant="contained"
            startIcon={<AddCircleIcon fontSize="large" />}
            sx={{
              height: 47,
              color: 'black',
              backgroundColor: 'white',
              borderRadius: '10px',
              fontWeight: 'bold',
              fontSize: '17px',
              padding: '9px',
              '& .MuiButton-startIcon': {
                marginRight: '8px',
              },
            }}
            onClick={handleOpenDialog} // Open dialog when button is clicked
          >
            Add Pig
          </Button>
        </Grid2>
      </Grid2>

      {/* ReusableDialogBox to be shown when openDialog is true */}
      {openDialog && (
        <ReusableDialogBox
          title="Add Pig"
          description="Fill up the necessary information."
          formFields={[
            {
              placeholder: 'Date of Birth',
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: 'Parent Number',
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: 'Sex',
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: 'Pen Number',
              icon: <DirectionsBikeIcon />,
            },
          ]}
          onSave={handleSave} // Handle save action
          onCancel={handleCloseDialog} // Handle cancel action
          saveButtonText="Add Pig"
          saveButtonColor="#11703b" // Green color for the save button
        />
      )}
    </>
  )
}
