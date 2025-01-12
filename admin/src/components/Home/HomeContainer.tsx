import React from 'react';
import Box from '@mui/material/Box';
import './HomeScreen.css';
import hugepig from '../../assets/hugepig.svg';
import {
  Grid2,
  Stack,
  ThemeProvider,
  Typography,
  useMediaQuery,
} from '@mui/material';
import theme from '../../Theme';

interface SimpleContainerProps {
  total_pigs: number;
}

export default function SimpleContainer({
  total_pigs = 0,
}: SimpleContainerProps) {
  const isLgUp = useMediaQuery(theme.breakpoints.up('lg'));

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container size={12} className="homeContainer">
        <Grid2
          container
          spacing={3}
          size={{ xs: 12, lg: 6 }}
          alignContent={'space-evenly'}
        >
          <Grid2 size={12}>
            <Stack
              spacing={2}
              direction={{ xs: 'column', lg: 'row' }}
              useFlexGap
              sx={{ flexWrap: 'wrap' }}
            >
              <Typography
                fontWeight={700}
                color="white"
                sx={{
                  fontSize: 'clamp(7rem, 9vw, 13rem)',
                  lineHeight: 0.8,
                  margin: 0,
                  padding: 0,
                }}
                alignContent={'center'}
              >
                {total_pigs}
              </Typography>

              <Typography
                sx={{
                  fontSize: 'clamp(2rem, 3vw, 6.5rem)',
                  lineHeight: 1.1,
                }}
                fontWeight={700}
                color="white"
                alignSelf={{ xs: 'center', lg: 'flex-end' }}
                textAlign="justify"
              >
                Total
                {isLgUp && <br />} Living Pigs
              </Typography>
            </Stack>
          </Grid2>

          <Grid2 size={{ lg: 12, xl: 12 }}>
            <Typography
              variant="subtitle1"
              color="white"
              fontWeight={100}
              textAlign={{ xs: 'center', lg: 'start' }}
            >
              PigKeep web provides a platform for pig farm owners to efficiently
              manage and analyze their pig farm records. Any updates made on the
              PigKeep mobile app will be integrated into the records on the web
              platform.
            </Typography>
          </Grid2>
        </Grid2>

        <Grid2 container size={{ xs: 12, lg: 6 }}>
          <Box className="hugePig">
            <Box
              component="img"
              src={hugepig}
              alt="Huge Pig"
              className="responsiveImage"
              sx={{ width: { xs: 0, lg: 'clamp(440px, 36vw, 550px)' } }}
            />
          </Box>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  );
}
