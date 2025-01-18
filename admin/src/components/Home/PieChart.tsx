import * as React from 'react';
import { PieChart } from '@mui/x-charts/PieChart';
import { Container, Grid2, Typography, Box } from '@mui/material';
import './HomeScreen.css';
import { ThemeProvider } from '@emotion/react';
import theme from '../../Theme';
import { PieValueType } from '@mui/x-charts';
import { MakeOptional } from '@mui/x-charts/internals';

export default function BasicPie({
  data = [],
}: {
  data?: MakeOptional<PieValueType, 'id'>[];
}) {
  const currentDate = new Date().toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
  });

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container spacing={3}>
        <Grid2 size={12}>
          <Typography
            variant="h1"
            fontWeight={700}
            textAlign={{ xs: 'center', md: 'start' }}
            color="black"
          >
            Current Pig Count
          </Typography>
        </Grid2>
        <Grid2 size={12}>
          <Typography
            variant="body1"
            textAlign={{ xs: 'center', md: 'start' }}
            color="black"
            marginX={{ xs: 1, sm: 15, md: 0 }}
          >
            As of <span style={{ color: '#11703b' }}>{currentDate}</span>,{' '}
            {data.length === 0 ? (
              <>You don't have any pigs</>
            ) : (
              <>
                the largest portion of pigs on your farm are{' '}
                {data[0]?.label ?? ''}, with{' '}
                {data[data.length - 1]?.label ?? ''} pigs being the least
                numerous.
              </>
            )}
          </Typography>
        </Grid2>
        <Container>
          <Box
            sx={{
              paddingTop: 1,
              width: '100%',
              height: {
                xs: 180,
                sm: 300,
                md: 400,
                lg: 270,
                xl: 350,
              },
            }}
          >
            <PieChart
              colors={[
                '#11703B',
                '#208849',
                '#29A358',
                '#32BE67',
                '#44F485',
                '#53FFAE',
              ]}
              series={[
                {
                  data,
                },
              ]}
            />
          </Box>
        </Container>
      </Grid2>
    </ThemeProvider>
  );
}
