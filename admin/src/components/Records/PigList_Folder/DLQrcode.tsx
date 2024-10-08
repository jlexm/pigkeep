import { Download } from '@mui/icons-material'
import { Button, Grid2, ThemeProvider, Typography } from '@mui/material'
import theme from '../../../Theme'

export default function QRCode() {
  return (
    <ThemeProvider theme={theme}>
      <Grid2 size={12} sx={{ textAlign: {xs:'center', sm: 'start', md:'end'} }} >
        <Button
          variant="contained"
          startIcon={<Download fontSize="large" />}
          sx={{
            width: { xs: 100, sm: 110, md: 120, lg: 130, xl: 140 },
            height: { xs: 35, sm: 40, md: 45 },
            color: 'white',
            backgroundColor: '#F25B0C',
            borderRadius: '10px',
            fontSize: '17px',
            padding: '9px',
            '& .MuiButton-startIcon': {
              marginRight: '8px',
            },
          }}
        >
          <Typography
            sx={{
              fontWeight: 500,
              fontSize: 'clamp(11px, 1vw + 5px, 16px)',
            }}
          >
            QR Codes
          </Typography>
        </Button>
      </Grid2>
    </ThemeProvider>
  )
}
