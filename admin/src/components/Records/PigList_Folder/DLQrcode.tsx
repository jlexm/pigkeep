import { Download } from '@mui/icons-material'
import { Button, Grid2 } from '@mui/material'

export default function QRCode() {
  return (
    <Grid2 size={12} sx={{justifyContent: 'end'}}>
      <Button
        variant="contained"
        startIcon={<Download fontSize="large" />}
        sx={{
          height: 47,
          color: 'white',
          backgroundColor: '#F25B0C',
          fontWeight: 'bold',
          fontSize: '17px',
          borderRadius: '10px',
          '& .MuiButton-startIcon': {
            marginRight: '8px',
          },
        }}
      >
        QR Codes
      </Button>
    </Grid2>
  )
}
