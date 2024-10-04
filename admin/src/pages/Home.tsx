import { Grid2, Typography } from '@mui/material'
import BasicPie from '../components/Home/PieChart'
import SimpleContainer from '../components/Home/HomeContainer'
import VirtualizedList from '../components/Home/Notifications'
import BarGraph from '../components/Home/FinancialReport'
import Guide from '../components/Home/Guide'

const Home = () => {
  return (
    <Grid2
      container
      spacing={10}
      sx={{ marginX: 20, marginY: 5, paddingTop: 10 }}
    >
      {/* <Grid2 container size={12}>
        <Dropdown />
      </Grid2> */}
      <Grid2 container size={12}>
        <SimpleContainer />
      </Grid2>
      <Grid2 size={{ xs: 12, lg: 6 }}>
        <BasicPie />
      </Grid2>
      <Grid2 size={{ xs: 12, lg: 6 }}>
        <VirtualizedList />
      </Grid2>
      <Grid2 size={12}>
        <BarGraph />
      </Grid2>
      <Grid2 size={12}>
        <Guide />
      </Grid2>
      <Grid2 size={12}>
        <Typography variant="h6" className="quote">
          PigKeep. Pig management, done in your pocket.
        </Typography>
      </Grid2>
      <Grid2 container size={12} spacing={0}>
        <Grid2 size={6} sx={{ textAlign: 'start' }}>
          <Typography variant="body1">
            Developed by Maravilla & Talagtag
          </Typography>
        </Grid2>
        <Grid2 size={6} sx={{ textAlign: 'end' }}>
          <Typography variant="body1">Naga City, Philippines</Typography>
        </Grid2>
        <Grid2 size={6} sx={{ textAlign: 'start' }}>
          <Typography variant="body1">2024-All Rights Reserved.</Typography>
        </Grid2>
      </Grid2>
    </Grid2>
  )
}

export default Home
