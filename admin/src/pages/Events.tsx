import { SetStateAction, useState } from 'react'
import {  Button, Chip, Grid2 } from '@mui/material'
import '../components/Events/Events.css'
import EventIcon from '@mui/icons-material/Event'
import CurrentDataTable from '../components/Events/CurrentDataTable'
import UpcomingDataTable from '../components/Events/UpcomingDataTable'
import HistoryDataTable from '../components/Events/HistoryDataTable'
import ReusableDialogBox from '../modals/ReusableDialogBox'
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike';


const Events = () => {
  const [selectedChip, setSelectedChip] = useState('upcoming')

  const handleChipClick = (chip: SetStateAction<string>) => {
    setSelectedChip(chip)
  }

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
    <>
    <Grid2 container size={12} spacing={5} className="paddingTop">
      <Grid2 container size={12} spacing={5}>
        <Grid2 container size={{xs:12, lg:6}} className="eventContainer" spacing={0}>
          <Grid2 size={4} className="eventHeadTitle">
            <p className="eventTitle">Events</p>
          </Grid2>
          <Grid2 className="addButton" size={8}>
            <Button
              variant="contained"
              startIcon={<EventIcon />}
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
              onClick={handleOpenDialog}
            >
              Set Event
            </Button>
          </Grid2>
        </Grid2>
      </Grid2>
      <Grid2 container size={12}>
        <Grid2 container size={{xs:12,lg:6}} className='itemAlign'>
          <Grid2 container size={12}>
            <CurrentDataTable />
          </Grid2>
        </Grid2>
        <Grid2 container size={{xs:12,lg:6}} spacing={0} className="itemAlign">
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
                width: 90,
                backgroundColor:
                  selectedChip === 'upcoming' ? '#11703b' : 'white',
                color: selectedChip === 'upcoming' ? 'white' : 'black',
                border: selectedChip === 'upcoming' ? 'none' : '1px solid #ddd',
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
                width: 90,
                backgroundColor:
                  selectedChip === 'history' ? '#11703b' : 'white',
                color: selectedChip === 'history' ? 'white' : 'black',
                border: selectedChip === 'history' ? 'none' : '1px solid #ddd',
              }}
            />
          </Grid2>
          <Grid2 container size={12}>
            {selectedChip === 'upcoming' ? (
              <UpcomingDataTable />
            ) : (
              <HistoryDataTable />
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
              placeholder: "Date",
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: "Pig Number",
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: "Event Name",
              icon: <DirectionsBikeIcon />,
            },
          ]}
          onSave={handleSave} // Handle save action
          onCancel={handleCloseDialog} // Handle cancel action
          saveButtonText="Set"
          saveButtonColor="#11703b" // Green color for the save button
        />
      )}
    </>
  )
}

export default Events
