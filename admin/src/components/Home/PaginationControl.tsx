import * as React from 'react';
import { Button, Box, Typography } from '@mui/material';
import { ArrowBackIos, ArrowForwardIos } from '@mui/icons-material';

const monthNames = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

export default function MonthPagination({
  monthChange,
  yearChange,
  triggerData,
}: {
  yearChange?: (year: number) => void;
  monthChange?: (month: number, year: number) => void;
  triggerData?: any;
}) {
  const [date, setDate] = React.useState<Date>(new Date());

  React.useEffect(() => {
    const month = date.getMonth();
    const year = date.getFullYear();
    if (monthChange) {
      monthChange(month, year);
    }
    if (yearChange) {
      yearChange(year);
    }
  }, [date, triggerData]);

  const handlePreviousMonth = () => {
    setDate((prevDate) => {
      const newDate = new Date(prevDate);
      newDate.setMonth(newDate.getMonth() - 1);
      return newDate;
    });
  };

  const handleNextMonth = () => {
    setDate((prevDate) => {
      const newDate = new Date(prevDate);
      newDate.setMonth(newDate.getMonth() + 1);
      return newDate;
    });
  };

  const handlePreviousYear = () => {
    setDate((prevDate) => {
      const newDate = new Date(prevDate);
      newDate.setFullYear(newDate.getFullYear() - 1);
      return newDate;
    });
  };

  const handleNextYear = () => {
    setDate((prevDate) => {
      const newDate = new Date(prevDate);
      newDate.setFullYear(newDate.getFullYear() + 1);
      return newDate;
    });
  };

  const handlePrevious = () => {
    if (monthChange) {
      handlePreviousMonth();
    } else {
      handlePreviousYear();
    }
  };

  const handleNext = () => {
    if (monthChange) {
      handleNextMonth();
    } else {
      handleNextYear();
    }
  };

  const month = monthNames[date.getMonth()];
  const year = date.getFullYear();

  return (
    <Box
      sx={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        gap: 2,
      }}
    >
      <Button
        onClick={handlePrevious}
        sx={{ color: 'black', '&:hover': { color: '#0e5e2a' } }}
      >
        <ArrowBackIos />
      </Button>
      <Typography className="black" variant="h6">
        {monthChange && month + ', '} {year}
      </Typography>
      <Button
        onClick={handleNext}
        sx={{ color: 'black', '&:hover': { color: '#0e5e2a' } }}
      >
        <ArrowForwardIos />
      </Button>
    </Box>
  );
}
