import * as React from 'react';
import { Button, Box, Typography } from '@mui/material';
import { ArrowBackIos, ArrowForwardIos } from '@mui/icons-material';

const monthNames = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December'
];

export default function MonthPagination() {
  const [date, setDate] = React.useState(new Date());

  const handlePreviousMonth = () => {
    setDate(prevDate => {
      const newDate = new Date(prevDate);
      newDate.setMonth(newDate.getMonth() - 1);
      return newDate;
    });
  };

  const handleNextMonth = () => {
    setDate(prevDate => {
      const newDate = new Date(prevDate);
      newDate.setMonth(newDate.getMonth() + 1);
      return newDate;
    });
  };

  const month = monthNames[date.getMonth()];
  const year = date.getFullYear();

  return (
    <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 2 }}>
      <Button
        onClick={handlePreviousMonth}
        sx={{ color: "black", '&:hover': { color: '#0e5e2a' } }}
      >
        <ArrowBackIos />
      </Button>
      <Typography className='black' variant="h6">
        {`${month}, ${year}`}
      </Typography>
      <Button
        onClick={handleNextMonth}
        sx={{ color: "black", '&:hover': { color: '#0e5e2a' } }}
      >
        <ArrowForwardIos />
      </Button>
    </Box>
  );
}
