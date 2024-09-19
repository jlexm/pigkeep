import { Button, Grid2, Stack } from '@mui/material'
import './Disposal.css'
import MonthPagination from '../Home/PaginationControl'
import IndeterminateCheckBoxIcon from '@mui/icons-material/IndeterminateCheckBox';
import AddBoxIcon from '@mui/icons-material/AddBox';

export default function Dispose() {
  return (
    <Grid2 container size={12} spacing={3}>
      <Grid2 size={12} className="miniTitle">
        <p className="disposeTitle">Disposal Ledger</p>
      </Grid2>
      <Grid2 size={12}>
        <MonthPagination />
      </Grid2>
      <Grid2 container size={12} spacing={3} className="disposeInfoBg">
        <Grid2 container size={12} spacing={0} className="innerBoxBg">
          <Grid2 size={12}>
            <p className="size50">Pig Sales</p>
          </Grid2>
        </Grid2>
        <Grid2 size={12}>
          <text className='sales'>230,000</text>
        </Grid2>
      </Grid2>
      <Grid2 size={12}>
      <Stack spacing={5} direction="row" className='center'>
          <Button
            variant="contained"
            sx={{
              backgroundColor: '#FF0000',
              '&:hover': { backgroundColor: '#d32f2f' },
              width: 140,
              height:45,
              borderRadius:2,
              
            }}
            startIcon={<IndeterminateCheckBoxIcon />}
          >
            Deceased
          </Button>
          <Button
            variant="contained"
            sx={{
              backgroundColor: '#11703b',
              '&:hover': { backgroundColor: '#117e4b' },
              width: 140,
              height:45,
              borderRadius:2,
            }}
            startIcon={<AddBoxIcon />}
          >
            Sell Pig
          </Button>
        </Stack>
      </Grid2>
    </Grid2>
  )
}
