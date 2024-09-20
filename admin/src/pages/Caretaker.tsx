import { Button, Grid2 } from '@mui/material'
import CaretakerDataTable from '../components/Caretaker/CaretakerDataTable'
import '../components/Caretaker/Caretaker.css'

const Caretaker = () => {
  return (
    <Grid2 container size={12} spacing={2} className="paddingTop">
      <Grid2 container size={12} className="items">
        <p className="feedHistory">Caretakers</p>
        <Button
          variant="contained"
          sx={{
            backgroundColor: '#11703b',
            '&:hover': { backgroundColor: '#117e4b' },
            width: 90,
            height: 45,
            borderRadius: 2,
          }}
        >
          Add
        </Button>
      </Grid2>
      <Grid2 container size={12}>
        <CaretakerDataTable />
      </Grid2>
    </Grid2>
  )
}

export default Caretaker
