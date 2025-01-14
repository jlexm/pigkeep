import { Box, Chip, Grid2, ThemeProvider, Typography } from '@mui/material';
import PigList_Screen from '../components/Records/PigList_Folder/PigList';
import FeedInventory_Screen from '../components/Records/FeedInventory_Folder/FeedInventory';
import MedicalRecords_Screen from '../components/Records/MedicalRecords_Folder/MedicalRecords';
import Pigpen_Screen from '../components/Records/PigPen_Folder/PigPen';
import React from 'react';
import '../components/Records/PigList_Folder/PigList.css';
import theme from '../Theme';

const Records = () => {
  const [selectedChip, setSelectedChip] = React.useState('Pig List'); // Default selected chip

  const handleChipClick = (chip: string) => {
    setSelectedChip(chip);
  };

  return (
    <ThemeProvider theme={theme}>
      <Grid2
        container
        spacing={3}
        sx={{
          marginX: { xs: 2, sm: 4, lg: 6, xl: 7 },
          paddingY: { xs: 2, sm: 5 },
        }}
      >
        <Grid2 size={12}>
          <Grid2
            container
            size={12}
            style={{ color: 'black', textAlign: 'start' }}
          >
            <Box
              sx={{
                display: 'flex',
                gap: { xs: 0.5, sm: 1.5, lg: 2 },
              }}
            >
              <Chip
                label={
                  <Typography
                    fontSize={{
                      xs: '11px',
                      sm: '14px',
                      md: '16px',
                      lg: '17px',
                    }}
                    fontWeight={200}
                  >
                    Pig pen
                  </Typography>
                }
                clickable
                onClick={() => handleChipClick('Pigpen')}
                sx={{
                  backgroundColor:
                    selectedChip === 'Pigpen' ? '#11703b' : 'transparent',
                  color: selectedChip === 'Pigpen' ? 'white' : 'black',
                  borderColor: '#11703b',
                  borderWidth: '1px',
                  borderStyle: 'solid',
                  padding: {
                    xs: '2px',
                    sm: '8px 10px',
                    md: '8px 20px',
                    lg: '10px 50px',
                  },
                  borderRadius: '10px',
                  fontSize: '16px',
                  '&:hover': {
                    backgroundColor:
                      selectedChip === 'Pigpen'
                        ? '#11703b'
                        : 'rgba(46, 125, 50, 0.1)',
                  },
                }}
              />
              <Chip
                label={
                  <Typography
                    fontSize={{
                      xs: '11px',
                      sm: '14px',
                      md: '16px',
                      lg: '17px',
                    }}
                    fontWeight={200}
                  >
                    Pig list
                  </Typography>
                }
                clickable
                onClick={() => handleChipClick('Pig List')}
                sx={{
                  backgroundColor:
                    selectedChip === 'Pig List' ? '#11703b' : 'transparent',
                  color: selectedChip === 'Pig List' ? 'white' : 'black',
                  borderColor: '#11703b',
                  borderWidth: '1px',
                  borderStyle: 'solid',
                  padding: {
                    xs: '2px',
                    sm: '8px 10px',
                    md: '8px 20px',
                    lg: '10px 50px',
                  },
                  borderRadius: '10px',
                  fontSize: '16px',
                  '&:hover': {
                    backgroundColor:
                      selectedChip === 'Pig List'
                        ? '#11703b'
                        : 'rgba(46, 125, 50, 0.1)',
                  },
                }}
              />
              <Chip
                label={
                  <Typography
                    fontSize={{
                      xs: '11px',
                      sm: '14px',
                      md: '16px',
                      lg: '17px',
                    }}
                    fontWeight={200}
                  >
                    Feed Inventory
                  </Typography>
                }
                clickable
                onClick={() => handleChipClick('Feed Inventory')}
                sx={{
                  backgroundColor:
                    selectedChip === 'Feed Inventory'
                      ? '#11703b'
                      : 'transparent',
                  color: selectedChip === 'Feed Inventory' ? 'white' : 'black',
                  borderColor: '#11703b',
                  borderWidth: '1px',
                  borderStyle: 'solid',
                  padding: {
                    xs: '2px',
                    sm: '8px 10px',
                    md: '8px 20px',
                    lg: '10px 50px',
                  },
                  borderRadius: '10px',
                  fontSize: '16px',
                  '&:hover': {
                    backgroundColor:
                      selectedChip === 'Feed Inventory'
                        ? '#11703b'
                        : 'rgba(46, 125, 50, 0.1)',
                  },
                }}
              />
              <Chip
                label={
                  <Typography
                    fontSize={{
                      xs: '11px',
                      sm: '14px',
                      md: '16px',
                      lg: '17px',
                    }}
                    fontWeight={200}
                  >
                    Medical Records
                  </Typography>
                }
                clickable
                onClick={() => handleChipClick('Medical Records')}
                sx={{
                  backgroundColor:
                    selectedChip === 'Medical Records'
                      ? '#11703b'
                      : 'transparent',
                  color: selectedChip === 'Medical Records' ? 'white' : 'black',
                  borderColor: '#11703b',
                  borderWidth: '1px',
                  borderStyle: 'solid',
                  padding: {
                    xs: '2px',
                    sm: '8px 10px',
                    md: '8px 20px',
                    lg: '10px 50px',
                  },
                  borderRadius: '10px',
                  fontSize: '16px',
                  '&:hover': {
                    backgroundColor:
                      selectedChip === 'Medical Records'
                        ? '#11703b'
                        : 'rgba(46, 125, 50, 0.1)',
                  },
                }}
              />
            </Box>
          </Grid2>
        </Grid2>

        <Grid2 container size={12} spacing={3}>
          <Grid2 size={12}>
            {selectedChip === 'Pig List' && <PigList_Screen />}
            {selectedChip === 'Feed Inventory' && <FeedInventory_Screen />}
            {selectedChip === 'Medical Records' && <MedicalRecords_Screen />}
            {selectedChip === 'Pigpen' && <Pigpen_Screen />}
          </Grid2>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  );
};

export default Records;
