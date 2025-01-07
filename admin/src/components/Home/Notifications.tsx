import * as React from 'react'
import Box from '@mui/material/Box'
import ListItem from '@mui/material/ListItem'
import ListItemButton from '@mui/material/ListItemButton'
import ListItemText from '@mui/material/ListItemText'
import { FixedSizeList, ListChildComponentProps } from 'react-window'
import { Grid2, Link, ThemeProvider, Typography } from '@mui/material'
import './HomeScreen.css' // Ensure this file includes the scrollbar styling
import theme from '../../Theme'

// Generate a list of example events with dates and other data
const generateEvents = (count: number) => {
  const events = []
  const today = new Date()

  for (let i = 0; i < count; i++) {
    const date = new Date(today)
    date.setDate(today.getDate() - i) // Make each event date progressively earlier
    events.push({
      date: date.toISOString().split('T')[0], // Convert date to YYYY-MM-DD format
      name: `Event ${i + 1}`,
      pigNumber: String(i + 1).padStart(3, '0'), // Starting from 001
    })
  }

  return events
}

// Generate a larger set of events
const allEvents = generateEvents(50) // Generate 50 example events
const events = allEvents.slice(0, 20)

function formatEventDate(dateString: string) {
  const eventDate = new Date(dateString)
  const today = new Date()

  today.setHours(0, 0, 0, 0)
  eventDate.setHours(0, 0, 0, 0)

  const diffTime = today.getTime() - eventDate.getTime()
  const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24))

  if (diffDays === 0) {
    return 'Today'
  } else if (diffDays === 1) {
    return 'Yesterday'
  } else {
    return eventDate.toLocaleDateString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric',
    })
  }
}

export default function PigEventsNotification({ pigEvents } : { pigEvents: any[] }) {

  // Memoized row component to avoid unnecessary re-renders
  const RenderRow = React.memo(({ index, style }: ListChildComponentProps) => {
    const event = pigEvents[index];

    // Define alternating colors
    const backgroundColor = index % 2 === 0 ? '#f1f1f1' : '#ffffff'; 

    const eventDateString = formatEventDate(event.eventDate)
    const eventStatus = eventDateString === 'Today' ? 'In Progress' : event.status

    return (
      <ThemeProvider theme={theme}>
        <ListItem
          style={{
            ...style,
            paddingBottom: 15,
            backgroundColor: backgroundColor, 
            borderRadius: '3px', 
          }}
          key={event.uuid}
          component="div"
          disablePadding
        >
          <ListItemButton>
            <Box className="listBox">
              <Box className="listRow1">
                <ListItemText
                  className="black"
                  primary={eventDateString}
                  sx={{ flex: '1', fontSize: 16 }}
                />
                <ListItemText
                  className="black"
                  primary={event.eventType}
                  sx={{
                    flex: '1',
                    textAlign: 'right',
                    fontSize: 16,
                    fontWeight: 800,
                  }}
                />
              </Box>
              <Box className="listRow1">
                <ListItemText
                  className="black"
                  primary={
                    <Typography variant="body1">
                      Pig{' '}
                      <span style={{ color: 'green' }}>{event.pigNumber}</span>
                    </Typography>
                  }
                  sx={{ flex: '1' }}
                />
                <Typography 
                  variant="body2" 
                  fontWeight={100} 
                  color={'green'} 
                  sx={{ textDecoration: 'underline'}}
                  >
                    {eventStatus}
                </Typography>
              </Box>
            </Box>
          </ListItemButton>
        </ListItem>
      </ThemeProvider>
    );
  })

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container size={12} spacing={2}>
        <Grid2 size={6}>
          <Typography
            variant="h6"
            fontWeight={700}
            color="black"
            textAlign="start"
          >
            Notification
          </Typography>
        </Grid2>
        <Grid2 size={6} className="seeEventsLink">
          <Link style={{ color: 'green' }} href="#" underline="hover">
            <Typography variant="body1">{'See Events'}</Typography>
          </Link>
        </Grid2>
        <Box
          sx={{
            width: '100%',
            height: 580,
            overflowY: 'auto',
            overflowX: { xs: 'auto', md: 'hidden' }, // Add horizontal scroll on xs, sm sizes
            whiteSpace: { xs: 'nowrap', md: 'normal' }, // Prevent wrapping on smaller screens
          }}
        >
          <FixedSizeList
            height={560}
            itemSize={82}
            itemCount={pigEvents.length}
            overscanCount={5} // Adds some buffer to prevent flickering
          >
            {RenderRow}
          </FixedSizeList>
        </Box>
      </Grid2>
    </ThemeProvider>
  )
}
