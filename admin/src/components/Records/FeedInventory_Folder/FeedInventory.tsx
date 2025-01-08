import { Grid2, ThemeProvider, Typography } from '@mui/material'
import AddFeedComp from './AddFeed'
import FeedInvDataTable from './FeedInvDataTable'
import theme from '../../../Theme'
import { useEffect, useState } from 'react'
import { fetchFeedsByFarm, fetchFeedsHistoryByFarm } from '../../../services/feed.service'
import { getSelectedFarm } from '../../../services/farm.service'

export default function FeedInventory_Screen() {

  const localStorageSelectedFarm = getSelectedFarm()

  const [feeds, setFeeds] = useState<any[]>([])
  const [feedHistory, setFeedHistory] = useState<any[]>([]) 

  // init feeds page
  useEffect(() => {
    if(!localStorageSelectedFarm) {
      throw new Error('No farm selected')
    }
    const farm_id = localStorageSelectedFarm['_id']
    fetchFeeds(farm_id)
    fetchFeedHistory(farm_id)
  }, [])

  const fetchFeeds = async (farm_id: string) => {
    const farmFeeds = (await fetchFeedsByFarm(farm_id) as any) ?? []
    setFeeds(farmFeeds)
  }

  const fetchFeedHistory = async (farm_id: string) => {
    const farmFeedHistory = (await fetchFeedsHistoryByFarm(farm_id) as any) ?? []
    setFeedHistory(farmFeedHistory.sort((a: any, b: any) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime()))
  }

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container size={12} spacing={5}>
        <Grid2 container size={{ xs: 12, lg: 4 }}>
          <Grid2 size={12}>
            <AddFeedComp feeds={feeds} feedHistory={feedHistory} />
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
            <FeedInvDataTable feedHistory={feedHistory} />
          </Grid2>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  )
}
