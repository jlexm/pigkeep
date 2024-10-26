import { Grid2 } from '@mui/material'
import AddPigComp from './AddPigComponent'
import Cards from './DynamicCard'
import PigStatusLegend from './Legend'
import QRCode from './DLQrcode'
import DataTable from './PigListDataTable'
export default function PigList_Screen() {
  return (
    <Grid2 container size={12} spacing={{ xs: 2, lg: 5 }}>
      <Grid2
        size={{ xs: 12, sm: 12, md: 4.5, lg: 3.5, xl: 3 }}
        sx={{ alignContent: { md: 'center' } }}
      >
        <AddPigComp />
      </Grid2>
      <Grid2
        size={{ xs: 12, sm: 12, md: 7.5, lg: 5.5, xl: 5.5 }}
        className="legendGrid"
      >
        <Cards />
      </Grid2>
      <Grid2
        size={{ xs: 12, sm: 7, md: 10, lg: 1.5, xl: 1.5 }}
        className="itemsAlign"
      >
        <PigStatusLegend statuses={['Alive', 'Sold', 'Deceased']} />
      </Grid2>
      <Grid2
        size={{ xs: 12, sm: 5, md: 2, lg: 1, xl: 1 }}
        sx={{ alignContent: 'center' }}
      >
        <QRCode />
      </Grid2>
      <Grid2 container size={12}>
        <DataTable />
      </Grid2>
    </Grid2>
  )
}
