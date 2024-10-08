import React, { useState } from 'react'
import { Box, Button, Grid2, ThemeProvider, Typography } from '@mui/material'
import AddCircleIcon from '@mui/icons-material/AddCircle'
import ReusableDialogBox from '../../../modals/ReusableDialogBox'
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike'
import theme from '../../../Theme'

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
    <ThemeProvider theme={theme}>
      <Grid2
        container
        size={12}
        sx={{ placeContent: { xs: 'center', md: 'start' } }}
      >
        <Grid2
          container
          size={{ xs: 12, sm: 9, md: 12 }}
          className="feedContainer"
          spacing={0}
        >
          <Grid2 size={7}>
            <Grid2 container>
            <Typography
              fontWeight={700}
              color="white"
              sx={{ fontSize: 'clamp(3rem, 4vw, 4.688rem)' }}
            >
              44
            </Typography>
              <Box alignContent={'center'}>
              <Box className="total">
            <Typography variant="body2">
              Total <br />
              Living Pigs
            </Typography>
          </Box>
              </Box>
            </Grid2>
          </Grid2>
          <Grid2 size={5} sx={{ alignContent: 'center', textAlign: 'end' }}>
          <Button
            variant="contained"
            startIcon={<AddCircleIcon fontSize="large" />}
            sx={{
              width: { xs: 90, sm: 100, md: 110 },
              height: { xs: 35, sm: 40, md: 45 },
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
            <Typography
              sx={{
                fontWeight: 500,
                fontSize: 'clamp(11px, 1vw + 5px, 16px)',
              }}
            >
              Add Pig
            </Typography>
          </Button>
          </Grid2>
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
    </ThemeProvider>
  )
}
