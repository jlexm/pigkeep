import { Grid2, Typography } from '@mui/material';
import DisposalDataTable from '../components/Disposal/DisposalDataTable';
import '../components/Disposal/Disposal.css';
import Dispose from '../components/Disposal/Dispose';
import { ThemeProvider } from '@emotion/react';
import theme from '../Theme';
import { getSelectedFarm } from '../services/farm.service';
import { useEffect, useState } from 'react';
import { fetchLedgers } from '../services/ledger.service';

const Disposal = () => {
  const localStorageSelectedFarm = getSelectedFarm();

  const [ledgers, setLedgers] = useState<any[]>([]);

  // init feeds page
  useEffect(() => {
    if (!localStorageSelectedFarm) {
      throw new Error('No farm selected');
    }
    const farm_id = localStorageSelectedFarm['_id'];
    getLedgers(farm_id);
  }, []);

  const getLedgers = async (farm_id: string) => {
    const ledger = ((await fetchLedgers(farm_id)) as any) ?? [];
    setLedgers(
      ledger.map((ledge: any) => ({
        ...ledge,
        pigNumber: ledge.pigDetails?.[0]?.pigNumber,
      }))
    );
  };

  return (
    <ThemeProvider theme={theme}>
      <Grid2
        container
        size={12}
        spacing={5}
        sx={{
          paddingX: { xs: 2, sm: 4, lg: 6, xl: 7 },
          paddingY: { xs: 2, sm: 5 },
        }}
      >
        <Grid2 container size={{ xs: 12, lg: 4 }}>
          <Grid2 size={12}>
            <Dispose ledgers={ledgers} />
          </Grid2>
        </Grid2>
        <Grid2 container size={{ xs: 12, lg: 8 }}>
          <Grid2 size={12}>
            <Typography variant="h4" color="black" textAlign="start">
              Disposal Records
            </Typography>
            <DisposalDataTable ledgers={ledgers} />
          </Grid2>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  );
};

export default Disposal;
