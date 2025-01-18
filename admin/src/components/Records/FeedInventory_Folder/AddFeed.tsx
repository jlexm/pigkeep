import { Box, Grid2, ThemeProvider, Typography } from '@mui/material';
import './Feed.css';
import MonthPagination from '../../Home/PaginationControl';
import FeedTable from './FeedTable';
import ReusableDialogBox from '../../../modals/ReusableDialogBox';
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

  const [totalCost, setTotalCost] = useState<number>(0);

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
    </ThemeProvider>
  );
}
