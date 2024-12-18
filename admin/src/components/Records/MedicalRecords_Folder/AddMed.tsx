import { Box, Button, Grid2, ThemeProvider, Typography } from '@mui/material'
import './Medicine.css'
import AddCircleIcon from '@mui/icons-material/AddCircle'
import MonthPagination from '../../Home/PaginationControl'
import FeedTable from './MedicalTable'
import ReusableDialogBox from '../../../modals/ReusableDialogBox'
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike'
import { useState } from 'react'
import theme from '../../../Theme'

// format peso sign
const formatCurrency = (amount: number) => {
  return `₱${amount.toLocaleString()}`
}

export default function AddMedComp() {
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
      <Grid2 container size={12} spacing={3} >
        <Grid2 size={12} className="miniTitle" sx={{paddingX: {xs:3}}}>
          <Typography fontSize={'clamp(2rem, 5vw, 3rem)'} fontWeight={'bold'} sx={{ paddingTop: 3 }}>
            Total Medicine Expense
          </Typography>
        </Grid2>
        <Grid2 size={12}>
          <MonthPagination />
        </Grid2>
        <Grid2 container size={12} sx={{ placeContent: 'center' }}>
          <Grid2
            container
            size={{ xs: 12 }}
            className="medContainer"
            spacing={0}
          >
            <Grid2 size={12}>
              <Grid2>
                <Box sx={{ textAlign: 'center' }}>
                  <Typography
                    fontWeight={'bold'}
                    color="white"
                    sx={{ fontSize: 'clamp(3rem, 2.7vw, 4.688rem)' }}
                  >
                    {formatCurrency(80000)}
                  </Typography>
                </Box>
              </Grid2>
            </Grid2>
            {/* <Grid2 size={5} sx={{ alignContent: 'center', textAlign: 'end' }}>
              <Button
                variant="contained"
                startIcon={<AddCircleIcon fontSize="large" />}
                sx={{
                  width: { xs: 100, sm: 115, md: 130 },
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
                onClick={handleOpenDialog}
              >
                <Typography
                  sx={{
                    fontWeight: 500,
                    fontSize: 'clamp(11px, 1vw + 5px, 16px)',
                  }}
                >
                  Add Meds
                </Typography>
              </Button>
            </Grid2> */}
          </Grid2>
        </Grid2>
        <Grid2 container size={12} spacing={1}>
          <Grid2 size={12}>
            <Typography
              variant="h6"
              fontWeight={500}
              color="black"
              sx={{ padding: 3 }}
            >
              Current Medicine Inventory
            </Typography>
          </Grid2>
          <Grid2 size={12} paddingX={{ xs: 4, sm: 5, lg: 2 }} >
            <FeedTable />
          </Grid2>
        </Grid2>
      </Grid2>

      {/* ReusableDialogBox to be shown when openDialog is true */}
      {openDialog && (
        <ReusableDialogBox
          title="Add Medicine"
          description="Fill up the necessary information."
          formFields={[
            {
              placeholder: 'Medicine Name',
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: 'Unit',
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: 'Quantity',
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: 'Cost',
              icon: <DirectionsBikeIcon />,
            },
          ]}
          onSave={handleSave} // Handle save action
          onCancel={handleCloseDialog} // Handle cancel action
          saveButtonText="Add Medicine"
          saveButtonColor="#3B4DE1" // Green color for the save button
        />
      )}
    </ThemeProvider>
  )
}
