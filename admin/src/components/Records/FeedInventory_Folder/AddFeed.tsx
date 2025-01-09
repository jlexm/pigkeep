import { Box, Button, Grid2, ThemeProvider, Typography } from '@mui/material';
import './Feed.css';
import AddCircleIcon from '@mui/icons-material/AddCircle';
import MonthPagination from '../../Home/PaginationControl';
import FeedTable from './FeedTable';
import ReusableDialogBox from '../../../modals/ReusableDialogBox';
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike';
import { useState } from 'react';
import theme from '../../../Theme';

// format peso sign
const formatCurrency = (amount: number) => {
  return `${amount.toLocaleString('en-PH', {
    style: 'currency',
    currency: 'PHP',
  })}`;
};

export default function AddFeedComp({
  feeds,
  feedHistory,
}: {
  feeds: any[];
  feedHistory: any[];
}) {
  // State to manage the dialog box visibility
  const [openDialog, setOpenDialog] = useState(false);

  const [totalCost, setTotalCost] = useState<number>(0);

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

  const handlePaginationChange = (month: number, year: number) => {
    const totalCost = feedHistory.reduce((acc, feed) => {
      const feedDate = new Date(feed.createdAt);
      if (feedDate.getMonth() === month && feedDate.getFullYear() === year) {
        return acc + feed.cost;
      }
      return acc;
    }, 0);
    setTotalCost(totalCost);
  };

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container size={12} spacing={3}>
        <Grid2 size={12} className="miniTitle" sx={{ paddingX: { xs: 3 } }}>
          <Typography
            fontSize={'clamp(2rem, 5vw, 3rem)'}
            fontWeight={'bold'}
            sx={{ paddingTop: 3 }}
          >
            Total Feed Expense
          </Typography>
        </Grid2>
        <Grid2 size={12}>
          <MonthPagination
            monthChange={handlePaginationChange}
            triggerData={feeds}
          />
        </Grid2>
        <Grid2 container size={12} sx={{ placeContent: 'center' }}>
          <Grid2
            container
            size={{ xs: 12 }}
            className="feedContainer"
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
                    {formatCurrency(totalCost)}
                  </Typography>
                </Box>
              </Grid2>
            </Grid2>
            {/* <Grid2 size={5} sx={{ alignContent: 'center', textAlign: 'end' }}>
              <Button
                variant="contained"
                startIcon={<AddCircleIcon fontSize="large" />}
                sx={{
                  width: { xs: 95, sm: 115, md: 125 },
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
                  Add Feed
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
              Current Feed Inventory
            </Typography>
          </Grid2>
          <Grid2 size={12} paddingX={{ xs: 4, sm: 5, lg: 2 }}>
            <FeedTable feeds={feeds} />
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
              placeholder: 'Feed Type',
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: 'Weight in kg',
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: 'Cost',
              icon: <DirectionsBikeIcon />,
            },
          ]}
          onSave={handleSave} // Handle save action
          onCancel={handleCloseDialog} // Handle cancel action
          saveButtonText="Add Feed"
          saveButtonColor="#11703b" // Green color for the save button
        />
      )}
    </ThemeProvider>
  );
}
