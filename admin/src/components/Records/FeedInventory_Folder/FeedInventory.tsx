import { Grid2, ThemeProvider, Typography } from '@mui/material'
import AddFeedComp from './AddFeed'
import FeedInvDataTable from './FeedInvDataTable'
import theme from '../../../Theme'

export default function FeedInventory_Screen() {
  return (
    <ThemeProvider theme={theme}>
      <Grid2 container size={12} spacing={5}>
        <Grid2 container size={{ xs: 12, lg: 4 }}>
          <Grid2 size={12}>
            <AddFeedComp />
          </Grid2>
        </Grid2>
        <Grid2
          container
          spacing={2}
          size={{ xs: 12, lg: 8 }}
          sx={{ placeContent: 'flex-start' }}
        >
          <Grid2 container size={12}>
            <Typography
              variant="h5"
              fontWeight={'bold'}
              color="black"
              textAlign= "start"
            >
              Feed History
            </Typography>
          </Grid2>
          <Grid2>
            <FeedInvDataTable />
          </Grid2>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  )
}
