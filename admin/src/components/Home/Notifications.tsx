import * as React from 'react'
import Box from '@mui/material/Box'
import ListItem from '@mui/material/ListItem'
import ListItemButton from '@mui/material/ListItemButton'
import ListItemText from '@mui/material/ListItemText'
import { FixedSizeList, ListChildComponentProps } from 'react-window'
import { Grid2, Link, ThemeProvider, Typography } from '@mui/material'
import './HomeScreen.css'
import theme from '../../Theme'
import { getTodayMidnight } from '../../services/utils.service'

const generateEvents = (count: number) => {
  const events = []
  const today = new Date()

  for (let i = 0; i < count; i++) {
    const date = new Date(today)
    date.setDate(today.getDate() - i)
    events.push({
      date: date.toISOString().split('T')[0], // yyyy-mm-dd format
      name: `Event ${i + 1}`,
      pigNumber: String(i + 1).padStart(3, '0'),
    })
  }

  return events
}

const allEvents = generateEvents(50)
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
  const today = getTodayMidnight();

  const RenderRow = React.memo(({ index, style }: ListChildComponentProps) => {
    const event = pigEvents[index];

    // alternating bg colors
    const backgroundColor = index % 2 === 0 ? '#f1f1f1' : '#ffffff';
    const eventDateString = formatEventDate(event.eventDate);

    const eventStatus =  new Date(event.eventDate) <= today ? 'In Progress' : event.status

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
          <Link style={{ color: 'green' }} href="\events" underline="hover">
            <Typography variant="body1">{'See Events'}</Typography>
          </Link>
        </Grid2>
        <Box
          sx={{
            width: '100%',
            height: 580,
            overflowY: 'auto',
            overflowX: { xs: 'auto', md: 'hidden' },
            whiteSpace: { xs: 'nowrap', md: 'normal' },
          }}
        >
          <FixedSizeList
            height={560}
            itemSize={82}
            itemCount={pigEvents.length}
            overscanCount={5} // buffer to prevent flickering
          >
            {RenderRow}
          </FixedSizeList>
        </Box>
      </Grid2>
    </ThemeProvider>
  )
}
