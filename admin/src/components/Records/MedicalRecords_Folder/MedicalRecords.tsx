import { Grid2 } from '@mui/material'
import AddMedComp from './AddMed'
import MedInvDataTable from './MedInvDataTable'

export default function MedicalRecords_Screen() {
  return (
    <Grid2 container size={12} spacing={5}>
      <Grid2 container size={4}>
        <Grid2 size={12}>
          <AddMedComp />
        </Grid2>
      </Grid2>{' '}
      <Grid2 container size={8} className='itemAlign'>
        <Grid2 size={12}>
          <p className='feedHistory'>Medical History</p>
          <MedInvDataTable />
        </Grid2>
      </Grid2>
    </Grid2>
  )
}
