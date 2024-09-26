import { Button, Grid2, Stack } from '@mui/material'
import './Disposal.css'
import MonthPagination from '../Home/PaginationControl'
import IndeterminateCheckBoxIcon from '@mui/icons-material/IndeterminateCheckBox'
import AddBoxIcon from '@mui/icons-material/AddBox'
import ReusableDialogBox from '../../modals/ReusableDialogBox'
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike'
import { useState } from 'react'

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
    <>
      <Grid2 container size={12} spacing={3}>
        <Grid2 size={12} className="miniTitle">
          <p className="disposeTitle">Disposal Ledger</p>
        </Grid2>
        <Grid2 size={12}>
          <MonthPagination />
        </Grid2>
        <Grid2 container size={12} spacing={3} className="disposeInfoBg">
          <Grid2 container size={12} spacing={0} className="innerBoxBg">
            <Grid2 size={12}>
              <p className="size50">Pig Sales</p>
            </Grid2>
          </Grid2>
          <Grid2 size={12}>
            <text className="sales">230,000</text>
          </Grid2>
        </Grid2>
        <Grid2 size={12}>
          <Stack spacing={5} direction="row" className="center">
            <Button
              variant="outlined"
              sx={{
                '&:hover': { backgroundColor: '#d32f2f', color: 'white', borderColor: '#FF0000' },
                width: 140,
                height: 45,
                borderRadius: 2,
                borderColor:'#FF0000',
                color: '#FF0000'
              }}
              startIcon={<IndeterminateCheckBoxIcon />}
              onClick={handleOpenDeceasedDialog}
            >
              Deceased
            </Button>
            <Button
              variant="contained"
              sx={{
                backgroundColor: '#11703b',
                '&:hover': { backgroundColor: '#117e4b' },
                width: 140,
                height: 45,
                borderRadius: 2,
              }}
              startIcon={<AddBoxIcon />}
              onClick={handleOpenDialog}
            >
              Sell Pig
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
          saveButtonColor="#11703b" // Green color for the save button
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
          saveButtonColor="#FF0000" // Green color for the save button
        />
      )}
    </>
  )
}
