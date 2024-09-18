import { Button, Grid2 } from '@mui/material'
import './PigPen.css'
import AddCircleIcon from '@mui/icons-material/AddCircle'
import PigpenDataTable from './PigPenDataTable'

export default function AddPenComp() {
  return (
    <Grid2 container size={12} spacing={3}>
      <Grid2 container size={12} className="penContainer" spacing={0}>
  <Grid2 size={2} className="penHeadTitle">
    <p className="penTitle">
      05 
    </p>
  </Grid2>
  <Grid2 size={3} className='center'>
    <p className='sidePen'>Total Pigpens</p>
  </Grid2>
  <Grid2 className="addButton" size={7}>
    <Button
      variant="contained"
      startIcon={<AddCircleIcon fontSize="large" />}
      sx={{
        height: 47,
        color: 'black',
        backgroundColor: 'white',
        borderRadius: '10px',
        fontWeight: 'bold',
        fontSize: '17px',
        '& .MuiButton-startIcon': {
          marginRight: '8px',
        },
      }}
    >
      Add Feed
    </Button>
  </Grid2>
</Grid2>

      <Grid2 container size={12} spacing={1}>
        <Grid2 size={12} className="left">
          <p className='margin0'>Pigpen Summary</p>
        </Grid2>
        <Grid2 size={12}>
          <PigpenDataTable />
        </Grid2>
      </Grid2>
    </Grid2>
  )
}
