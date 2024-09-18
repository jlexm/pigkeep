import React from 'react'
import { Box, Grid2, Typography, styled } from '@mui/material'

interface PigStatusLegendProps {
  statuses: ('Alive' | 'Sold' | 'Deceased')[]
}

const StyledBox = styled(Box)(({ theme }) => ({
  display: 'flex',
  alignItems: 'center',
  marginRight: theme.spacing(4.5),
}))

const PigStatusLegend: React.FC<PigStatusLegendProps> = ({ statuses }) => {
  const colorMap: Record<string, string> = {
    Alive: 'blue',
    Sold: 'green',
    Deceased: 'red',
  }

  return (
    <Grid2 >
      <Box display="flex" flexDirection="row" textAlign='right' className="legend">
        {statuses.map((status) => (
          <StyledBox key={status}>
            <Box
              component="span"
              sx={{
                width: 20,
                height: 20,
                borderRadius: '50%',
                backgroundColor: colorMap[status],
              }}
            />
            <Typography variant="body2" ml={1} color="black">
              {status}
            </Typography>
          </StyledBox>
        ))}
      </Box>
    </Grid2>
  )
}

export default PigStatusLegend
