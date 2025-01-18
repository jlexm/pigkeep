import {
  Grid2,
  ListItem,
  ListItemIcon,
  ListItemText,
  ThemeProvider,
  Typography,
} from '@mui/material';
import CircleIcon from '@mui/icons-material/Circle';
import './PigPen.css';
import theme from '../../../Theme';
import { clamp } from '@mui/x-data-grid/internals';

const pigs = [
  { number: '001', status: 'alive' },
  { number: '002', status: 'sold' },
  { number: '003', status: 'deceased' },
  // ... other pigs
];

const getStatusColor = (status: string) => {
  switch (status) {
    case 'alive':
      return 'blue';
    case 'sold':
      return 'green';
    case 'deceased':
      return 'red';
    default:
      return 'gray';
  }
};

export default function PenInfo({ selectedRow }: { selectedRow?: any }) {
  return (
    <ThemeProvider theme={theme}>
      <Grid2
        container
        size={12}
        spacing={3}
        sx={{ paddingX: { xs: 3, sm: 4, lg: 5 } }}
        className="penInfoBg"
      >
        {selectedRow ? (
          <>
            <Grid2
              container
              size={12}
              spacing={0}
              sx={{ paddingY: 5 }}
              className="miniPenInfoBg"
            >
              <Grid2 size={12}>
                <Typography
                  sx={{
                    fontSize: 'clamp(4rem, 6vw + 1rem, 7rem)',
                  }}
                  fontWeight={'bold'}
                  color="white"
                >
                  {selectedRow.penNumber}
                </Typography>
              </Grid2>
              <Grid2 size={12}>
                <Typography variant="h6" color="white">
                  Pen Number
                </Typography>
              </Grid2>
            </Grid2>
            <Grid2
              size={12}
              spacing={{ xs: 4 }}
              container
              sx={{ marginLeft: 4, marginRight: 4 }}
            >
              <Grid2
                size={{ xs: 12, sm: 6 }}
                color={'black'}
                sx={{ textAlign: { xs: 'center', sm: 'start' } }}
                spacing={5}
              >
                <Grid2 size={12} className="pigInfo">
                  <Typography variant="subtitle1" fontWeight={500}>
                    Pigpen information
                  </Typography>
                </Grid2>
                <Grid2 container sx={{ height: 15 }}></Grid2>
                <Grid2 size={12} sx={{ height: 30 }}>
                  <Typography variant="subtitle1">
                    Type: {''}
                    <span style={{ color: '#11703b', fontWeight: 500 }}>
                      {selectedRow.penType}
                    </span>
                  </Typography>
                </Grid2>

                <Grid2 size={12} sx={{ height: 30 }}>
                  <Typography variant="subtitle1">
                    Pig Count:{' '}
                    <span style={{ color: '#11703b', fontWeight: 500 }}>
                      {selectedRow.pigs?.length ?? 0}
                    </span>
                  </Typography>
                </Grid2>
                <Grid2 size={12} sx={{ height: 30 }}>
                  <Typography variant="subtitle1">
                    Max Pig:{' '}
                    <span style={{ color: '#11703b', fontWeight: 500 }}>
                      {selectedRow.maxPigCount}
                    </span>
                  </Typography>
                </Grid2>
              </Grid2>

              <Grid2
                size={{ xs: 12, sm: 6 }}
                color={'black'}
                sx={{ textAlign: { xs: 'center', sm: 'end' } }}
                spacing={5}
              >
                <Grid2 size={12} className="pigInfo">
                  <Typography variant="subtitle1" fontWeight={500}>
                    Pigs Contained
                  </Typography>
                </Grid2>
                <Grid2 container sx={{ height: 15 }}></Grid2>
                <Grid2
                  container
                  spacing={0}
                  justifyContent={{ xs: 'center', sm: 'end' }}
                >
                  {selectedRow.pigs &&
                    selectedRow.pigs.map((pig: any, index: number) => (
                      <Grid2 size={{ xs: 6, sm: 6 }} key={index}>
                        <ListItem
                          sx={{
                            paddingLeft: {
                              xs: 3.5,
                              sm: 4,
                              md: 0,
                              lg: 3,
                              xl: 8,
                            },
                            paddingRight: { xs: 3, sm: 2, md: 0 },
                          }}
                          textAlign={'end'}
                        >
                          <ListItemIcon sx={{ minWidth: 30 }}>
                            <CircleIcon
                              sx={{
                                color: getStatusColor(pig.status),
                                fontSize: 'clamp(20px, 2vw, 25px)',
                              }}
                            />
                          </ListItemIcon>

                          <ListItemText
                            sx={{
                              textAlign: {
                                xs: 'start',
                                sm: 'end',
                                md: 'start',
                                lg: 'end',
                              },
                            }}
                            primary={pig.pigNumber}
                          />
                        </ListItem>
                      </Grid2>
                    ))}
                </Grid2>
              </Grid2>
            </Grid2>
          </>
        ) : (
          <>
            <Typography variant="h6" color="black">
              Select a pen to view details.
            </Typography>
          </>
        )}
      </Grid2>
    </ThemeProvider>
  );
}
