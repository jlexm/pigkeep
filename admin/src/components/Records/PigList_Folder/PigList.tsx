import { Grid2 } from '@mui/material'
import AddPigComp from './AddPigComponent'
import Cards from './DynamicCard'
import PigStatusLegend from './Legend'
import QRCode from './DLQrcode'
import DataTable from './PigListDataTable'
export default function PigList_Screen() {
  return (
    <Grid2 container size={12} spacing={1}>
      <Grid2 size={{xs: 1 ,sm:2, lg:3}}>
        <AddPigComp />
      </Grid2>
      <Grid2 size={{xs: 8 ,sm:8, lg:5.5, xl:5.5}} className="legendGrid">
        <Cards />
      </Grid2>
      <Grid2 size={{lg:2}} className="itemsAlign">
        <PigStatusLegend statuses={['Alive', 'Sold', 'Deceased']} />
      </Grid2>
      <Grid2 size={1.5} className="qrButton">
        <QRCode />
      </Grid2>
      <Grid2 size={12}>
        <DataTable />
      </Grid2>
      
    </Grid2>
  )
}
