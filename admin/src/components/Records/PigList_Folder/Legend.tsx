import React from 'react';
import { Box, Grid2, ThemeProvider, Typography, styled } from '@mui/material';
import theme from '../../../Theme';

interface PigStatusLegendProps {
  statuses: ('Alive' | 'Sold' | 'Deceased')[];
}

const StyledBox = styled(Box)(({ theme }) => ({
  display: 'flex',
  alignItems: 'center',
  marginRight: theme.spacing(5),
}));

const PigStatusLegend: React.FC<PigStatusLegendProps> = ({ statuses }) => {
  const colorMap: Record<string, string> = {
    Alive: 'blue',
    Sold: 'green',
    Deceased: 'red',
  };

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container justifyContent={{xs: 'center', sm: 'end', lg: 'start'}}>
        <Box
          display="flex"
          sx={{
            flexDirection: {
              xs: 'row', 
              lg: 'column', 
              xl: 'row', 
            },
          }}
          justifyContent={{xs: 'center', sm: 'end', lg: 'start'}}
          className="legend"
        >
          {statuses.map((status) => (
            <StyledBox key={status} sx={{paddingY:'5px', marginRight: {xs:2, xl: 6}}}>
              <Box
                component="span"
                sx={{
                  width: {xs: 12, sm: 14, md:15, lg: 20},
                  height: {xs: 12, sm: 14, md: 15, lg: 20},
                  borderRadius: '50%',
                  backgroundColor: colorMap[status],
                }}
              />
              <Typography fontSize={'clamp(12px, 0.8vw, 26px)'} ml={1} color="black">
                {status}
              </Typography>
            </StyledBox>
          ))}
        </Box>
      </Grid2>
    </ThemeProvider>
  );
};

export default PigStatusLegend;
