import React from 'react'
import { Box, Grid2, ThemeProvider, Typography } from '@mui/material'
import theme from '../../../Theme'

export default function AddPigComp( { totalPigs = 0 } : { totalPigs?: number }) {

  return (
    <ThemeProvider theme={theme}>
      <Grid2
        container
        size={12}
        sx={{ placeContent: { xs: 'center'} }}
      >
        <Grid2
          container
          size={{ xs: 12}}
          className="feedContainer"
          spacing={0}

        >
          <Grid2 size={12} >
            <Grid2 container sx={{placeContent: 'center'}}>
            <Typography
              fontWeight={700}
              color="white"
              sx={{ fontSize: 'clamp(3.5rem, 4vw, 4.688rem)' }}
            >
              {totalPigs}
            </Typography>
              <Box alignContent={'center'}>
              <Box className="total">
            <Typography variant="body2">
              Total <br />
              Living Pigs
            </Typography>
          </Box>
              </Box>
            </Grid2>
          </Grid2>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  )
}
