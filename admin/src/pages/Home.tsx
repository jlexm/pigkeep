import { Grid2, ThemeProvider, Typography } from '@mui/material'
import BasicPie from '../components/Home/PieChart'
import SimpleContainer from '../components/Home/HomeContainer'
import VirtualizedList from '../components/Home/Notifications'
import BarGraph from '../components/Home/FinancialReport'
import Guide from '../components/Home/Guide'
import DropdownWithAddButton from '../components/Home/Dropdown'
import theme from '../Theme'
import React, { useEffect, useState } from 'react'
import { fetchMyFarms, getSelectedFarm, setSelectedFarm } from '../services/farm.service'
import { fetchAllFarmPigs } from '../services/pig.service'

const Home: React.FC = () => {
  // Default selected farm 
  const [selectedOption, setSelectedOption] = useState<any>()
  const [options, setOptions] = useState<any[]>([])

  const [pigs, setPigs] = useState<any[]>([])

  useEffect(() => {
    (async () => {
      const myFarms = await fetchMyFarms() as any
      setOptions(myFarms)
      const selectedFarm = getSelectedFarm() ?? myFarms[0]
      if(selectedFarm) {
        setSelectedOption(selectedFarm)
      }
      setSelectedFarm(selectedFarm)
      
      await fetchPigs(selectedFarm['_id']);

    })()
  },[])
  

  const fetchPigs = async (farm_id: string) => {
    const pigs = await fetchAllFarmPigs(farm_id) as any
    console.log(pigs)
    setPigs(pigs)
  }

  const handleAddNewItem = (newItem: string) => {
    setOptions((prevOptions) => [...prevOptions, newItem])
  }

  return (
    <ThemeProvider theme={theme}>
      <Grid2
        container
        spacing={10}
        sx={{
          paddingX: { xs: 2, sm: 5, md: 15, lg: 20, xl: 25 },
          paddingBottom: 5,
          paddingTop: {xs: 2, sm: 5}
        }}
      >
        <Grid2 container spacing={2} size={12}>
          <Grid2 size={{xs: 8, sm: 5, md: 6, lg: 5}}>
            <DropdownWithAddButton
              options={options}
              selected={selectedOption} // Pass the selected option
              onAddNewItem={handleAddNewItem}
            />
          </Grid2>
          <SimpleContainer total_pigs={pigs.length} />
        </Grid2>
        <Grid2 size={{ xs: 12, lg: 6 }}>
          <BasicPie />
        </Grid2>
        <Grid2 size={{ xs: 12, lg: 6 }}>
          <VirtualizedList />
        </Grid2>
        <Grid2 size={12}>
          <BarGraph />
        </Grid2>
        <Grid2 size={12}>
          <Guide />
        </Grid2>
        <Grid2 size={12}>
          <Typography variant="subtitle1" className="quote" fontWeight={400}>
            PigKeep. Pig management, done in your pocket.
          </Typography>
        </Grid2>
        <Grid2 container size={12} spacing={0}>
          <Grid2
            size={{ xs: 12, md: 6 }}
            sx={{ textAlign: { xs: 'center', md: 'start' } }}
          >
            <Typography variant="body1" color="black">
              Developed by Maravilla & Talagtag
            </Typography>
          </Grid2>
          <Grid2
            size={{ xs: 12, md: 6 }}
            sx={{ textAlign: { xs: 'center', md: 'end' } }}
          >
            <Typography variant="body1" color="black">
              Naga City, Philippines
            </Typography>
          </Grid2>
          <Grid2
            size={{ xs: 12, md: 6 }}
            sx={{ textAlign: { xs: 'center', md: 'start' } }}
          >
            <Typography variant="body1" color="black">
              2024-All Rights Reserved.
            </Typography>
          </Grid2>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  )
}

export default Home
