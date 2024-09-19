import { Grid2 } from '@mui/material'

export default function Footer() {
  return (
    <Grid2 container size={12}>
      <Grid2 container size={12}>
        <Grid2 container size={6} sx={{ textAlign: 'start' }}>
          <p className="footer">Developed by Maravilla & Talagtag</p>
        </Grid2>
        <Grid2  size={6} sx={{ textAlign: 'end' }}>
          <p className="footer">Naga City, Philippines</p>
        </Grid2>
        <Grid2 container size={6} sx={{ textAlign: 'start' }}>
          <p className="footer">2024-All Rights Reserved.</p>
        </Grid2>
      </Grid2>

      <Footer></Footer>

    </Grid2>
  )
}
