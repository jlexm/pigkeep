import { Button, Grid2 } from '@mui/material'
import './Feed.css'
import AddCircleIcon from '@mui/icons-material/AddCircle'
import MonthPagination from '../../Home/PaginationControl'
import FeedTable from './FeedTable'
import ReusableDialogBox from '../../../modals/ReusableDialogBox';
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike';
import { useState } from 'react'


export default function AddFeedComp() {
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
    <Grid2 container size={12} spacing={3}>
      <Grid2 size={12} className="miniTitle">
        <p className="margin0">Total Feed Expense</p>
      </Grid2>
      <Grid2 size={12}>
        <MonthPagination />
      </Grid2>
      <Grid2 container size={12} className="feedContainer" spacing={0}>
        <Grid2 size={7} className="expenseTitle">
          <p className="expenseTitle">929,000</p>
        </Grid2>
        <Grid2 className="addButton" size={5}>
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
              '& .MuiButton-startIcon': {
                marginRight: '8px',
              },
            }}
            onClick={handleOpenDialog}
          >
            Add Feed
          </Button>
        </Grid2>
      </Grid2>
      <Grid2 container size={12} spacing={1}>
        <Grid2 size={12}>
          <p className="feedInv">Current Feed Inventory</p>
        </Grid2>
        <Grid2 size={12} sx={{marginLeft:2, marginRight:2}}>
          <FeedTable />
        </Grid2>
      </Grid2>
    </Grid2>
            {/* ReusableDialogBox to be shown when openDialog is true */}
      {openDialog && (
        <ReusableDialogBox
          title="Add Feed"
          description="Fill up the necessary information."
          formFields={[
            {
              placeholder: "Feed Type",
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: "Weight in kg",
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: "Cost",
              icon: <DirectionsBikeIcon />,
            },

          ]}
          onSave={handleSave} // Handle save action
          onCancel={handleCloseDialog} // Handle cancel action
          saveButtonText="Add Feed"
          saveButtonColor="#11703b" // Green color for the save button
        />
      )}
</>    
  )
}
