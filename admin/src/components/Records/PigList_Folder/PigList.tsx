import { Grid2 } from '@mui/material'
import AddPigComp from './AddPigComponent'
import Cards from './DynamicCard'
import PigStatusLegend from './Legend'
import QRCode from './DLQrcode'
import DataTable from './PigListDataTable'
export default function PigList_Screen() {
  return (
    <Grid2 container size={12} spacing={2}>
      <Grid2 size={3}>
        <AddPigComp />
      </Grid2>
      <Grid2 size={5} className="legendGrid">
        <Cards />
      </Grid2>
      <Grid2 size={2.6} className="qrButton">
        <PigStatusLegend statuses={['Alive', 'Sold', 'Deceased']} />
      </Grid2>
      <Grid2 size={1.4} className="qrButton">
        <QRCode />
      </Grid2>
      <Grid2 size={12}>
        <DataTable />
      </Grid2>
      
    </Grid2>
  )
}
