import * as React from 'react'
import { DataGrid, GridColDef } from '@mui/x-data-grid'
import Grid2 from '@mui/material/Grid2'
import {
  Box,
  TextField,
  MenuItem,
  Select,
  InputLabel,
  FormControl,
  Typography,
} from '@mui/material'
import { ThemeProvider } from '@emotion/react'
import theme from '../../../Theme'

const columns: GridColDef[] = [
  { field: 'feedType', headerName: 'Feed Type', flex: 1, minWidth: 170 },
  {
    field: 'action',
    headerName: 'Action',
    flex: 1,
    minWidth: 170,
    headerAlign: 'left',
    align: 'left',
    cellClassName: (params) => {
      return params.value === 'Add Feed'
        ? 'green-text'
        : params.value === 'Consume Feed'
        ? 'red-text'
        : ''
    },
  },
  {
    field: 'quantity',
    headerName: 'Quantity',
    flex: 1,
    minWidth: 170,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'date',
    headerName: 'Date',
    flex: 1,
    minWidth: 170,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'cost',
    headerName: 'Cost',
    flex: 1,
    minWidth: 170,
    headerAlign: 'right',
    align: 'right',
  },
]

const initialRows = [
  {
    id: 1,
    feedType: 'Uno Grower',
    action: 'Add Feed',
    quantity: '+25kg',
    date: 'Jun 25, 2024',
    cost: 'Php875',
  },
  {
    id: 2,
    feedType: 'Uno Starter',
    action: 'Consume Feed',
    quantity: '-25kg',
    date: 'Jun 8, 2024',
    cost: 'Php875',
  },
  {
    id: 3,
    feedType: 'Uno Grower',
    action: 'Consume Feed',
    quantity: '-25kg',
    date: 'Jun 18, 2024',
    cost: 'Php75',
  },
]

const paginationModel = { page: 0, pageSize: 5 }

export default function FeedInvDataTable() {
  const [searchText, setSearchText] = React.useState('')
  const [statusFilter, setStatusFilter] = React.useState('all')
  const [filteredRows, setFilteredRows] = React.useState(initialRows)

  // Function to handle filtering based on searchText and statusFilter
  const handleFilter = () => {
    const lowerSearchText = searchText.toLowerCase()
    const filtered = initialRows.filter((row) => {
      const matchesSearch =
        row.feedType.toLowerCase().includes(lowerSearchText) ||
        row.action.toLowerCase().includes(lowerSearchText) ||
        row.quantity.toLowerCase().includes(lowerSearchText) ||
        row.date.toLowerCase().includes(lowerSearchText) ||
        row.cost.toLowerCase().includes(lowerSearchText)
      const matchesStatus =
        statusFilter === 'all' || row.action === statusFilter
      return matchesSearch && matchesStatus
    })
    setFilteredRows(filtered)
  }

  React.useEffect(() => {
    handleFilter()
  }, [searchText, statusFilter])

  return (
    <ThemeProvider theme={theme}>
      <Grid2
        container
        justifyContent="start"
        sx={{ textAlign: 'start', width: '100%' }}
      >
        <Box
          sx={{
            marginBottom: 2,
            maxWidth: '100%',
            paddingTop: 2,
            display: 'flex',
            alignItems: 'start',
          }}
        >
          <TextField
            label="Search"
            variant="outlined"
            size="small"
            fullWidth
            value={searchText}
            onChange={(e) => setSearchText(e.target.value)}
          />
          <FormControl sx={{ minWidth: 170, marginLeft: 2 }}>
            <InputLabel>Status</InputLabel>
            <Select
              value={statusFilter}
              onChange={(e) => setStatusFilter(e.target.value)}
              size="small"
              label="Status"
            >
              <MenuItem value="all">
                <Box sx={{ display: 'flex', alignItems: 'center' }}>All</Box>
              </MenuItem>
              <MenuItem value="Add Feed">
                <Box sx={{ display: 'flex', alignItems: 'center' }}>
                  <Typography>Add Feed</Typography>
                </Box>
              </MenuItem>
              <MenuItem value="Consume Feed">
                <Box sx={{ display: 'flex', alignItems: 'center' }}>
                  <Typography>Consume Feed</Typography>
                </Box>
              </MenuItem>
            </Select>
          </FormControl>
        </Box>

        <Box
          sx={{
            width: '100%',
            maxWidth: '100%',
            overflowX: 'auto', 
            textAlign: 'start',
            minWidth: '100px', 
          }}
        >
          <DataGrid
            rows={filteredRows}
            columns={columns}
            initialState={{ pagination: { paginationModel } }}
            pageSizeOptions={[5, 10, 25, 50, 100]}
            rowSelection={false}
            getRowClassName={(params) =>
              params.indexRelativeToCurrentPage % 2 === 0
                ? 'even-row'
                : 'odd-row'
            }
            sx={{
              '& .MuiDataGrid-columnHeaders': {
                fontWeight: 'bold',
                fontSize: '15px',
                color: '#11703B',
              },
              '& .green-text': {
                color: '#11703B',
              },
              '& .red-text': {
                color: 'red',
              },
            }}
          />
        </Box>
      </Grid2>
    </ThemeProvider>
  )
}
