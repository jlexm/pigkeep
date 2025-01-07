import * as React from 'react';
import { Button, Box, Typography } from '@mui/material';
import { ArrowBackIos, ArrowForwardIos } from '@mui/icons-material';

const monthNames = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December'
];

export default function MonthPagination({ yearChange }: { yearChange?: (year: number) => void }) {
  const [date, setDate] = React.useState(new Date());

  React.useEffect(() => {
    yearChange && yearChange(date.getFullYear());
  }, [date])

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

  const handlePreviousYear = () => {
    setDate(prevDate => {
      const newDate = new Date(prevDate);
      newDate.setFullYear(newDate.getFullYear() - 1);
      return newDate;
    });
  };

  const handleNextYear = () => {
    setDate(prevDate => {
      const newDate = new Date(prevDate);
      newDate.setFullYear(newDate.getFullYear() + 1);
      return newDate;
    });
  };

  const month = monthNames[date.getMonth()];
  const year = date.getFullYear();
  

  return (
    <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 2 }}>
      <Button
        onClick={handlePreviousYear}
        sx={{ color: "black", '&:hover': { color: '#0e5e2a' } }}
      >
        <ArrowBackIos />
      </Button>
      <Typography className='black' variant="h6">
        {year}
      </Typography>
      <Button
        onClick={handleNextYear}
        sx={{ color: "black", '&:hover': { color: '#0e5e2a' } }}
      >
        <ArrowForwardIos />
      </Button>
    </Box>
  );
}
