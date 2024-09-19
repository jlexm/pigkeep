import { Grid2 } from '@mui/material'
import AddFeedComp from './AddFeed'
import FeedInvDataTable from './FeedInvDataTable'

export default function FeedInventory_Screen() {
  return (
    <Grid2 container size={12} spacing={5}>
      <Grid2 container size={4}>
        <Grid2 size={12}>
          <AddFeedComp />
        </Grid2>
      </Grid2>
      <Grid2 container size={8} className='itemAlign'>
        <Grid2 size={12}>
          <p className='feedHistory'>Feed History</p>
          <FeedInvDataTable />
        </Grid2>
      </Grid2>
    </Grid2>
  )
}
