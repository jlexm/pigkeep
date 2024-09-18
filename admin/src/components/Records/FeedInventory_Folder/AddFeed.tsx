import { Button, Grid2 } from '@mui/material'
import './Feed.css'
import AddCircleIcon from '@mui/icons-material/AddCircle'
import MonthPagination from '../../Home/PaginationControl'
import FeedTable from './FeedTable'

export default function AddFeedComp() {
  return (
    <Grid2 container size={12} spacing={3}>
      <Grid2 size={12} className="miniTitle">
        <p className="margin0">Total Feed Expense</p>
      </Grid2>
      <Grid2 size={12}>
        <MonthPagination />
      </Grid2>
      <Grid2 container size={12} className="feedContainer" spacing={0}>
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
            Add Feed
          </Button>
        </Grid2>
      </Grid2>
      <Grid2 container size={12} spacing={1}>
        <Grid2 size={12}>
          <p className="feedInv">Current Feed Inventory</p>
        </Grid2>
        <Grid2 size={12} sx={{marginLeft:2, marginRight:2}}>
          <FeedTable />
        </Grid2>
      </Grid2>
    </Grid2>
  )
}
