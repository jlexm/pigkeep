import * as React from 'react';
import Box from '@mui/material/Box';
import ListItem from '@mui/material/ListItem';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemText from '@mui/material/ListItemText';
import { FixedSizeList, ListChildComponentProps } from 'react-window';
import { Grid2, Link } from '@mui/material';
import './HomeScreen.css'; // Ensure this file includes the scrollbar styling

// Generate a list of example events with dates and other data
const generateEvents = (count: number) => {
  const events = [];
  const today = new Date();

  for (let i = 0; i < count; i++) {
    const date = new Date(today);
    date.setDate(today.getDate() - i); // Make each event date progressively earlier
    events.push({
      date: date.toISOString().split('T')[0], // Convert date to YYYY-MM-DD format
      name: `Event ${i + 1}`,
      pigNumber: String(i + 1).padStart(3, '0'), // Starting from 001
    });
  }

  return events;
};

// Generate a larger set of events
const allEvents = generateEvents(50); // Generate 50 example events
const events = allEvents.slice(0, 20);

function formatEventDate(dateString: string) {
  const eventDate = new Date(dateString);
  const today = new Date();

  today.setHours(0, 0, 0, 0);
  eventDate.setHours(0, 0, 0, 0);

  const diffTime = today.getTime() - eventDate.getTime();
  const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24));

  if (diffDays === 0) {
    return 'Today';
  } else if (diffDays === 1) {
    return 'Yesterday';
  } else {
    return eventDate.toLocaleDateString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric',
    });
  }
}

// Memoized row component to avoid unnecessary re-renders
const RenderRow = React.memo(({ index, style }: ListChildComponentProps) => {
  const event = events[index];

  return (
    <ListItem
      style={{ ...style, paddingBottom: 15 }}
      key={index}
      component="div"
      disablePadding
    >
      <ListItemButton>
        <Box className="listBox">
          <Box className="listRow1">
            <ListItemText
              className="black"
              primary={formatEventDate(event.date)}
              sx={{ flex: '1' }}
            />
            <ListItemText
              className="black"
              primary={event.name}
              sx={{ flex: '1', textAlign: 'right', fontSize: 18, fontWeight: 800 }}
            />
          </Box>
          <Box className="listRow1">
            <ListItemText
              className="black"
              primary={
                <span>
                  Pig <span style={{ color: 'green' }}>{event.pigNumber}</span>
                </span>
              }
              sx={{ flex: '1' }}
            />
            <Link
              href="#"
              underline="hover"
              sx={{ flex: '1', textAlign: 'right', color: 'green', fontSize: 16 }}
            >
              See details
            </Link>
          </Box>
        </Box>
      </ListItemButton>
    </ListItem>
  );
});

export default function VirtualizedList() {
  return (
    <Grid2 container size={12} spacing={1}>
      <Grid2 size={6}>
        <h1 className="notifHead">Notification</h1>
      </Grid2>
      <Grid2 size={6} className="seeEventsLink">
        <Link style={{ color: 'green' }} href="#" underline="hover">
          {'See Events'}
        </Link>
      </Grid2>
      <Box sx={{ width: '100%', height: 580, maxWidth: 670, overflowY: 'auto' }}>
        <FixedSizeList
          height={560}
          width={670}
          itemSize={82}
          itemCount={events.length}
          overscanCount={5} // Adds some buffer to prevent flickering
        >
          {RenderRow}
        </FixedSizeList>
      </Box>
    </Grid2>
  );
}
