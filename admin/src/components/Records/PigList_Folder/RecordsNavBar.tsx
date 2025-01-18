
import { Box, Chip, Grid2 } from '@mui/material'
import * as React from 'react';


export default function RecordsNavBar() {

  const [selectedChip, setSelectedChip] = React.useState('Pig List'); // default selected chip

  const handleChipClick = (chip: React.SetStateAction<string>) => {
    setSelectedChip(chip);
  };
  return (
    <Grid2 container spacing={3}>
      <Grid2 container size={12} style={{color: 'black', textAlign: 'start'}}>
      <Box sx={{ display: 'flex', gap: 2, }}>
        <Chip
          label="Pig List"
          clickable
          onClick={() => handleChipClick('Pig List')}
          sx={{
            backgroundColor: selectedChip === 'Pig List' ? '#11703b' : 'transparent',
            color: selectedChip === 'Pig List' ? 'white' : 'black',
            borderColor: '#11703b',
            borderWidth: '1px',
            borderStyle: 'solid',
            padding: '10px 50px',
            borderRadius: '10px',
            fontSize: '16px',
            '&:hover': {
              backgroundColor: selectedChip === 'Pig List' ? '#11703b' : 'rgba(46, 125, 50, 0.1)',
            },
          }}
        />
        <Chip
          label="Feed Inventory"
          clickable
          onClick={() => handleChipClick('Feed Inventory')}
          sx={{
            backgroundColor: selectedChip === 'Feed Inventory' ? '#11703b' : 'transparent',
            color: selectedChip === 'Feed Inventory' ? 'white' : 'black',
            borderColor: '#11703b',
            borderWidth: '1px',
            borderStyle: 'solid',
            padding: '10px 50px',
            borderRadius: '10px',
            fontSize: '16px',
            '&:hover': {
              backgroundColor: selectedChip === 'Feed Inventory' ? '#11703b' : 'rgba(46, 125, 50, 0.1)',
            },
          }}
        />
        <Chip
          label="Medical Records"
          clickable
          onClick={() => handleChipClick('Medical Records')}
          sx={{
            backgroundColor: selectedChip === 'Medical Records' ? '#11703b' : 'transparent',
            color: selectedChip === 'Medical Records' ? 'white' : 'black',
            borderColor: '#11703b',
            borderWidth: '1px',
            borderStyle: 'solid',
            padding: '10px 50px',
            borderRadius: '10px',
            fontSize: '16px',
            '&:hover': {
              backgroundColor: selectedChip === 'Medical Records' ? '#11703b' : 'rgba(46, 125, 50, 0.1)',
            },
          }}
        />
        <Chip
          label="Pigpen"
          clickable
          onClick={() => handleChipClick('Pigpen')}
          sx={{
            backgroundColor: selectedChip === 'Pigpen' ? '#11703b' : 'transparent',
            color: selectedChip === 'Pigpen' ? 'white' : 'black',
            borderColor: '#11703b',
            borderWidth: '1px',
            borderStyle: 'solid',
            padding: '10px 50px',
            borderRadius: '10px',
            fontSize: '16px',
            '&:hover': {
              backgroundColor: selectedChip === 'Pigpen' ? '#11703b' : 'rgba(46, 125, 50, 0.1)',
            },
          }}
        />
      </Box>
      </Grid2>
    </Grid2>
  )
}
