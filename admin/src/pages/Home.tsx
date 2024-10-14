import { Grid2, ThemeProvider, Typography } from '@mui/material'
import BasicPie from '../components/Home/PieChart'
import SimpleContainer from '../components/Home/HomeContainer'
import VirtualizedList from '../components/Home/Notifications'
import BarGraph from '../components/Home/FinancialReport'
import Guide from '../components/Home/Guide'
import DropdownWithAddButton from '../components/Home/Dropdown'
import theme from '../Theme'
import React, { useState } from 'react'

const Home: React.FC = () => {
  const [options, setOptions] = useState<string[]>([
    'Alex Pig Farm',
    'Dominic\'s Pig Farm',
    'Den\'s Pig Farm',
  ])
  
  // Default selected farm 
  const [selectedOption, setSelectedOption] = useState<string>('Dominix Pig Farm')

  const handleAddNewItem = (newItem: string) => {
    setOptions((prevOptions) => [...prevOptions, newItem])
  }

  const handleSelectChange = (event: React.ChangeEvent<{ value: unknown }>) => {
    setSelectedOption(event.target.value as string)
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
              selectedOption={selectedOption} // Pass the selected option
              onAddNewItem={handleAddNewItem}
              onSelectChange={handleSelectChange} // Pass the change handler
            />
          </Grid2>
          <SimpleContainer />
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
