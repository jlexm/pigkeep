import * as React from 'react'
import { PieChart } from '@mui/x-charts/PieChart'
import { Container, Grid2, Typography, Box } from '@mui/material'
import './HomeScreen.css'
import { ThemeProvider } from '@emotion/react'
import theme from '../../Theme'

export default function BasicPie() {
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
            Pig Count
          </Typography>
        </Grid2>
        <Grid2 size={12}>
          <Typography
            variant="body1"
            textAlign={{ xs: 'center', md: 'start' }}
            color="black"
            marginX={{ xs: 1, sm: 15 , md: 0 }}
          >
            As of <span style={{ color: '#11703b' }}>July 1, 2024</span>, the
            largest portion of pigs on your farm are weaners, with mature pigs
            being the least numerous.
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
                lg: 300, 
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
                  data: [
                    {
                      id: 1,
                      value: 15,
                      label: '15 series B',
                      color: '#11703B',
                    },
                    {
                      id: 0,
                      value: 10,
                      label: '10 series A',
                      color: '#208849',
                    },
                    {
                      id: 2,
                      value: 20,
                      label: '20 series C',
                      color: '#29A358',
                    },
                    {
                      id: 3,
                      value: 20,
                      label: '20 series D',
                      color: '#32BE67',
                    },
                  ],
                },
              ]}
            />
          </Box>
        </Container>
      </Grid2>
    </ThemeProvider>
  )
}
