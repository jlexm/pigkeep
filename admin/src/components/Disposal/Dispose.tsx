import { Grid2, ThemeProvider, Typography } from '@mui/material';
import './Disposal.css';
import MonthPagination from '../Home/PaginationControl';
import ReusableDialogBox from '../../modals/ReusableDialogBox';
import { useState } from 'react';
import theme from '../../Theme';

// format peso sign
const formatCurrency = (amount: number) => {
  return `${amount.toLocaleString('en-PH', {
    style: 'currency',
    currency: 'PHP',
  })}`;
};

export default function Dispose({ ledgers }: { ledgers: any[] }) {
  const [totalCost, setTotalCost] = useState<number>(0);

  // manage the dialog box
  const [openDialog, setOpenDialog] = useState(false);
  const [openDeceasedDialog, setOpenDeceasedDialog] = useState(false);

  // open the dialog
  const handleOpenDialog = () => {
    setOpenDialog(true);
  };

  const handleOpenDeceasedDialog = () => {
    setOpenDeceasedDialog(true);
  };

  // close the dialog
  const handleCloseDialog = () => {
    setOpenDialog(false);
  };

  const handleCloseDeceasedDialog = () => {
    setOpenDeceasedDialog(false);
  };

  // save action in dialog
  const handleSave = () => {
    console.log('Saving sold pig data...');
    handleCloseDialog();
  };

  const handleSaveDeceased = () => {
    console.log('Saving deceased pig data...');
    handleCloseDeceasedDialog();
  };

  const handlePaginationChange = (month: number, year: number) => {
    const totalCost = ledgers.reduce((acc, ledger) => {
      const date = new Date(ledger.transactionDate);
      if (date.getMonth() === month && date.getFullYear() === year) {
        return acc + ledger.priceSold;
      }
      return acc;
    }, 0);
    setTotalCost(totalCost);
  };

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container size={12} spacing={3}>
        <Grid2 size={12} className="miniTitle">
          <Typography
            fontSize={'clamp(2rem, 5vw, 3rem)'}
            fontWeight={'bold'}
            sx={{ paddingTop: { xs: 0, lg: 3 } }}
          >
            Disposal Ledger
          </Typography>
        </Grid2>
        <Grid2 size={12}>
          <MonthPagination
            monthChange={handlePaginationChange}
            triggerData={ledgers}
          />
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
                  Total Pig Sales
                </Typography>
              </Grid2>
            </Grid2>
            <Grid2 size={12}>
              <Typography variant="h2" fontWeight={'bold'} color="white">
                {formatCurrency(totalCost)}
              </Typography>
            </Grid2>
          </Grid2>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  );
}
