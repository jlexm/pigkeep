import { Grid2 } from '@mui/material'

import AddPenComp from './AddPen'
import PenInfo from './PenInfo'

export default function Pigpen_Screen() {
  return (
    <Grid2 container size={12} spacing={5}>
      <Grid2 container size={{xs: 12, md:6}}>
        <AddPenComp/>
      </Grid2>
      <Grid2 container size={{xs: 12, md:6}} className='itemAlign'>
        <PenInfo />
      </Grid2>
    </Grid2>
  )
}
