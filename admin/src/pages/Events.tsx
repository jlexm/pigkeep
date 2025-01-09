import { SetStateAction, useEffect, useState } from 'react';
import {
  Box,
  Button,
  Chip,
  Grid2,
  ThemeProvider,
  Typography,
} from '@mui/material';
import '../components/Events/Events.css';
import EventIcon from '@mui/icons-material/Event';
import CurrentDataTable from '../components/Events/CurrentDataTable';
import UpcomingDataTable from '../components/Events/UpcomingDataTable';
import HistoryDataTable from '../components/Events/HistoryDataTable';
import ReusableDialogBox from '../modals/ReusableDialogBox';
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike';
import theme from '../Theme';
import { getSelectedFarm } from '../services/farm.service';
import { fetchFarmPigEvents } from '../services/pig-events.service';
import {
  formatDate,
  formatDateNumeric,
  getTodayMidnight,
} from '../services/utils.service';

const Events = () => {
  const localStorageSelectedFarm = getSelectedFarm();

  const [pigEventsData, setPigEventsData] = useState<{
    current: any[];
    upcoming: any[];
    history: any[];
  }>({ current: [], upcoming: [], history: [] });
  const [selectedChip, setSelectedChip] = useState('upcoming');

  useEffect(() => {
    if (!localStorageSelectedFarm) throw new Error('No farm selected');
    const farm_id = localStorageSelectedFarm['_id'];
    getPigEvents(farm_id);
  }, []);

  async function getPigEvents(farm_id: string) {
    const farmPigEvents = ((await fetchFarmPigEvents(farm_id)) as any) ?? [];
    const today = getTodayMidnight();

    const current = farmPigEvents.filter(
      (event: any) =>
        event.status !== 'Completed' &&
        formatDateNumeric(new Date(event.eventDate)) <= formatDateNumeric(today)
    );
    const upcoming = farmPigEvents.filter(
      (event: any) =>
        formatDateNumeric(new Date(event.eventDate)) > formatDateNumeric(today)
    );
    const history = farmPigEvents.filter(
      (event: any) => event.status === 'Completed'
    );
    setPigEventsData({ current, upcoming, history });
  }

  const handleChipClick = (chip: SetStateAction<string>) => {
    setSelectedChip(chip);
  };

  // State to manage the dialog box visibility
  const [openDialog, setOpenDialog] = useState(false);

  // Function to open the dialog
  const handleOpenDialog = () => {
    setOpenDialog(true);
  };

  // Function to close the dialog
  const handleCloseDialog = () => {
    setOpenDialog(false);
  };

  // Function to handle save action in the dialog
  const handleSave = () => {
    console.log('Saving pig data...');
    handleCloseDialog(); // Close dialog after saving
  };

  return (
    <ThemeProvider theme={theme}>
      <Grid2
        container
        size={12}
        spacing={5}
        sx={{
          paddingX: { xs: 2, sm: 4, lg: 6, xl: 7 },
          paddingY: { xs: 2, sm: 5 },
        }}
      >
        <Grid2
          container
          size={12}
          spacing={5}
          sx={{ placeContent: { xs: 'center', md: 'start' } }}
        >
          <Grid2
            container
            size={{ xs: 12 }}
            className="feedContainer"
            spacing={0}
          >
            <Grid2 size={12}>
              <Grid2>
                <Box sx={{ textAlign: 'center' }}>
                  <Typography
                    fontWeight={'bold'}
                    color="white"
                    sx={{ fontSize: 'clamp(2.5rem, 2.7vw, 4.688rem)' }}
                  >
                    Pig Farm Events
                  </Typography>
                </Box>
              </Grid2>
            </Grid2>
            {/* <Grid2 size={5} sx={{ alignContent: 'center', textAlign: 'end' }}>
              <Button
                variant="contained"
                startIcon={<EventIcon fontSize="large" />}
                sx={{
                  width: { xs: 110, sm: 115, md: 130 },
                  height: { xs: 35, sm: 40, md: 45 },
                  color: 'black',
                  backgroundColor: 'white',
                  borderRadius: '10px',
                  fontWeight: 'bold',
                  fontSize: '17px',
                  padding: '9px',
                  '& .MuiButton-startIcon': {
                    marginRight: '8px',
                  },
                }}
                onClick={handleOpenDialog}
              >
                <Typography
                  sx={{
                    fontWeight: 500,
                    fontSize: 'clamp(11px, 1vw + 5px, 16px)',
                  }}
                >
                  Add Event
                </Typography>
              </Button>
            </Grid2> */}
          </Grid2>
        </Grid2>
        <Grid2 container size={12}>
          <Grid2 container size={{ xs: 12, lg: 6 }} className="itemAlign">
            <Grid2 container size={12}>
              <CurrentDataTable currentEvents={pigEventsData.current} />
            </Grid2>
          </Grid2>
          <Grid2
            container
            size={{ xs: 12, lg: 6 }}
            spacing={0}
            className="itemAlign"
          >
            <Grid2 container size={12} spacing={0}>
              <Chip
                label="Upcoming"
                variant={selectedChip === 'upcoming' ? 'filled' : 'outlined'}
                color="default"
                onClick={() => handleChipClick('upcoming')}
                sx={{
                  marginRight: 0,
                  cursor: 'pointer',
                  borderRadius: '10px 0 0 10px',
                  width: 'clamp(70px, 24vw, 115px)',
                  backgroundColor:
                    selectedChip === 'upcoming' ? '#11703b' : 'white',
                  color: selectedChip === 'upcoming' ? 'white' : 'black',
                  border:
                    selectedChip === 'upcoming' ? 'none' : '1px solid #ddd',
                  fontSize: 'clamp(0.7rem, 0.90vw, 1rem)',
                }}
              />

              <Chip
                label="History"
                variant={selectedChip === 'history' ? 'filled' : 'outlined'}
                color="default"
                onClick={() => handleChipClick('history')}
                sx={{
                  marginLeft: 0,
                  cursor: 'pointer',
                  borderRadius: '0 10px  10px 0',
                  width: 'clamp(70px, 24vw, 115px)',
                  backgroundColor:
                    selectedChip === 'history' ? '#11703b' : 'white',
                  color: selectedChip === 'history' ? 'white' : 'black',
                  border:
                    selectedChip === 'history' ? 'none' : '1px solid #ddd',
                  fontSize: 'clamp(0.7rem, 0.90vw, 1rem)',
                }}
              />
            </Grid2>
            <Grid2 container size={12}>
              {selectedChip === 'upcoming' ? (
                <UpcomingDataTable upcomingEvents={pigEventsData.upcoming} />
              ) : (
                <HistoryDataTable eventHistory={pigEventsData.history} />
              )}
            </Grid2>
          </Grid2>
        </Grid2>
      </Grid2>

      {/* ReusableDialogBox to be shown when openDialog is true */}
      {openDialog && (
        <ReusableDialogBox
          title="Set Event"
          description="Fill up the form to set an event for your pig farm."
          formFields={[
            {
              placeholder: 'Date',
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: 'Pig Number',
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: 'Event Name',
              icon: <DirectionsBikeIcon />,
            },
          ]}
          onSave={handleSave} // Handle save action
          onCancel={handleCloseDialog} // Handle cancel action
          saveButtonText="Set"
          saveButtonColor="#11703b" // Green color for the save button
        />
      )}
    </ThemeProvider>
  );
};

export default Events;
