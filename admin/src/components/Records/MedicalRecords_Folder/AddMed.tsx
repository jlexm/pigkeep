import { Button, Grid2 } from '@mui/material'
import './Medicine.css'
import AddCircleIcon from '@mui/icons-material/AddCircle'
import MonthPagination from '../../Home/PaginationControl'
import FeedTable from './MedicalTable'

export default function AddMedComp() {
  return (
    <Grid2 container size={12} spacing={3}>
      <Grid2 size={12} className="miniTitle">
        <p className="margin0">Total Medicine Expense</p>
      </Grid2>
      <Grid2 size={12}>
        <MonthPagination />
      </Grid2>
      <Grid2 container size={12} className="medContainer" spacing={0}>
        <Grid2 size={7} className="expenseTitle">
          <p className="expenseTitle">929,000</p>
        </Grid2>
        <Grid2 className="addButton" size={5}>
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
            Add Meds
          </Button>
        </Grid2>
      </Grid2>
      <Grid2 container size={12} spacing={1}>
        <Grid2 size={12}>
          <p className="feedInv">Current Medicine Inventory</p>
        </Grid2>
        <Grid2 size={12} sx={{marginLeft:2, marginRight:2}}>
          <FeedTable />
        </Grid2>
      </Grid2>
    </Grid2>
  )
}
