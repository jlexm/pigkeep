import { Box, Grid2, ThemeProvider, Typography } from '@mui/material';
import './PigPen.css';
import PigpenDataTable from './PigPenDataTable';
import theme from '../../../Theme';

export default function AddPenComp({
  pens = [],
  onRowSelect,
}: {
  pens?: any[];
  onRowSelect?: (row: any) => void;
}) {

  // row selection from table
  const handleRowSelect = (rowData: any) => {
    setSelectedRow(rowData);
    console.log('Selected Row:', rowData);
  };

  return (
    <ThemeProvider theme={theme}>
      <Grid2
        container
        size={12}
        sx={{ placeContent: { xs: 'center', md: 'start' } }}
      >
        <Grid2
          container
          size={{ xs: 12, sm: 8, md: 12 }}
          className="feedContainer"
          spacing={0}
        >
          <Grid2 size={12}>
            <Grid2 container sx={{ placeContent: { xs: 'center' } }}>
              <Box sx={{ textAlign: 'left' }}>
                <Typography
                  fontWeight={'bold'}
                  color="white"
                  sx={{ fontSize: 'clamp(3.2rem, 5.1vw, 4.1rem)' }}
                >
                  {pens.length}
                </Typography>
              </Box>
              <Box alignContent={'center'}>
                <Typography
                  fontSize="clamp(0.8rem, 5vw, 1.8rem)"
                  paddingLeft={1}
                  color="white"
                  fontWeight={300}
                >
                  Total Pig Pens
                </Typography>
              </Box>
            </Grid2>
          </Grid2>
        </Grid2>
        <Grid2 size={12}>
          <PigpenDataTable onRowSelect={onRowSelect} pens={pens} />
        </Grid2>
      </Grid2>
    </ThemeProvider>
  );
}
