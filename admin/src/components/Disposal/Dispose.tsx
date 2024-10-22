import { Button, Grid2, Stack, ThemeProvider, Typography } from '@mui/material'
import './Disposal.css'
import MonthPagination from '../Home/PaginationControl'
import IndeterminateCheckBoxIcon from '@mui/icons-material/IndeterminateCheckBox'
import AddBoxIcon from '@mui/icons-material/AddBox'
import ReusableDialogBox from '../../modals/ReusableDialogBox'
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike'
import { useState } from 'react'
import theme from '../../Theme'

export default function Dispose() {
  // State to manage the dialog box visibility
  const [openDialog, setOpenDialog] = useState(false)
  const [openDeceasedDialog, setOpenDeceasedDialog] = useState(false)

  // Function to open the dialog
  const handleOpenDialog = () => {
    setOpenDialog(true)
  }

  const handleOpenDeceasedDialog = () => {
    setOpenDeceasedDialog(true)
  }

  // Function to close the dialog
  const handleCloseDialog = () => {
    setOpenDialog(false)
  }

  const handleCloseDeceasedDialog = () => {
    setOpenDeceasedDialog(false)
  }

  // Function to handle save action in the dialog
  const handleSave = () => {
    console.log('Saving sold pig data...')
    handleCloseDialog() // Close dialog after saving
  }

  const handleSaveDeceased = () => {
    console.log('Saving deceased pig data...')
    handleCloseDeceasedDialog() // Close dialog after saving
  }

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container size={12} spacing={3}>
        <Grid2 size={12} className="miniTitle">
          <Typography fontSize={'clamp(2rem, 5vw, 3rem)'} fontWeight={'bold'} sx={{ paddingTop: {xs: 0, lg: 3} }}>
            Disposal Ledger
          </Typography>
        </Grid2>
        <Grid2 size={12}>
          <MonthPagination />
        </Grid2>
        <Grid2 container size={12} sx={{ placeContent: 'center' }}>
          <Grid2
            container
            size={{ xs: 12, sm: 9, md: 8, lg: 12 }}
            padding={3}
            
            spacing={3}
            className="disposeInfoBg"
          >
            <Grid2 container size={12} paddingY={2} className="innerBoxBg">
              <Grid2 size={12}>
                <Typography variant="h5" fontWeight={500} color="black">
                  Pig Sales
                </Typography>
              </Grid2>
            </Grid2>
            <Grid2 size={12}>
              <Typography variant="h2" fontWeight={'bold'} color="white">
                230,000
              </Typography>
            </Grid2>
          </Grid2>
        </Grid2>
        <Grid2 size={12}>
          <Stack
            spacing={5}
            direction="row"
            sx={{ justifyContent: 'center', paddingTop: 2 }}
          >
            <Button
              variant="outlined"
              sx={{
                '&:hover': {
                  backgroundColor: '#d32f2f',
                  color: 'white',
                  borderColor: '#FF0000',
                },
                width: { xs: 100, sm: 110, md: 125, lg: 130, xl: 140 },
                height: { xs: 35, sm: 40, md: 45 },
                borderRadius: 2,
                borderColor: '#FF0000',
                color: '#FF0000',
              }}
              startIcon={<IndeterminateCheckBoxIcon />}
              onClick={handleOpenDeceasedDialog}
            >
              <Typography
                sx={{
                  fontWeight: 500,
                  fontSize: 'clamp(11px, 1vw + 5px, 16px)',
                }}
              >
                Deceased
              </Typography>
            </Button>
            <Button
              variant="contained"
              sx={{
                backgroundColor: '#554F91',
                '&:hover': { backgroundColor: '#554F71' },
                width: { xs: 100, sm: 120, md: 125, lg: 130, xl: 140 },
                height: { xs: 35, sm: 42, md: 45 },
                borderRadius: 2,
              }}
              startIcon={<AddBoxIcon />}
              onClick={handleOpenDialog}
            >
               <Typography
                sx={{
                  fontWeight: 500,
                  fontSize: 'clamp(11px, 1vw + 5px, 16px)',
                }}
              >
                Sell Pig
              </Typography>
            </Button>
          </Stack>
        </Grid2>
      </Grid2>

      {/* Sell */}
      {openDialog && (
        <ReusableDialogBox
          title="Sell Pig"
          description="Fill up the necessary information."
          formFields={[
            {
              placeholder: 'Pig Number',
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: 'Weight in kg',
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: 'Price',
              icon: <DirectionsBikeIcon />,
            },
          ]}
          onSave={handleSave} // Handle save action
          onCancel={handleCloseDialog} // Handle cancel action
          saveButtonText="Sell Pig"
          saveButtonColor="#554F91" 
        />
      )}

      {/* Deceased */}
      {openDeceasedDialog && (
        <ReusableDialogBox
          title="Deceased Pig"
          description="Fill up the necessary information."
          formFields={[
            {
              placeholder: 'Pig Number',
              icon: <DirectionsBikeIcon />,
            },
          ]}
          onSave={handleSaveDeceased} // Handle save action
          onCancel={handleCloseDeceasedDialog} // Handle cancel action
          saveButtonText="Remove"
          saveButtonColor="#FF0000" 
        />
      )}
    </ThemeProvider>
  )
}
