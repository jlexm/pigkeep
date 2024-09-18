import { Grid2 } from '@mui/material'

import AddPenComp from './AddPen'

export default function Pigpen_Screen() {
  return (
    <Grid2 container size={12} spacing={5}>
      <Grid2 container size={6}>
        <AddPenComp/>
      </Grid2>
      <Grid2 container size={6}></Grid2>
    </Grid2>
  )
}
