import { Grid2 } from '@mui/material'
import BasicPie from '../components/Home/PieChart'
import SimpleContainer from '../components/Home/HomeContainer'
import VirtualizedList from '../components/Home/Notifications'
import BarGraph from '../components/Home/FinancialReport'
import Guide from '../components/Home/Guide'


const Home = () => {
  return (
    <Grid2 container spacing={10}>
      <Grid2 size={12}>
        <SimpleContainer />
      </Grid2>
      <Grid2 size={6}>
        <BasicPie />
      </Grid2>
      <Grid2 size={6}>
        <VirtualizedList />
      </Grid2>
      <Grid2 size={12}>
        <BarGraph />
      </Grid2>
      <Grid2 size={12}>
        <Guide />
      </Grid2>
      <Grid2 size={12}>
        <p className="quote">PigKeep. Pig management, done in your pocket.</p>
      </Grid2>
    </Grid2>
  )
}

export default Home
