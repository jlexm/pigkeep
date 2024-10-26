import * as React from 'react'
import { DataGrid, GridColDef, GridToolbar } from '@mui/x-data-grid'
import Grid2 from '@mui/material/Grid2'
import {
  Box,
  TextField,
  MenuItem,
  Select,
  InputLabel,
  FormControl,
  ThemeProvider,
} from '@mui/material'

import '../PigList_Folder/PigList.css'
import theme from '../../../Theme'

const columns: GridColDef[] = [
  {
    field: 'medType',
    headerName: 'Medicine Name',
    flex: 1,
    minWidth: 170,
    resizable: false,
  },
  {
    field: 'action',
    headerName: 'Action',
    flex: 1,
    minWidth: 140,
    resizable: false,
    headerAlign: 'left',
    align: 'left',

    cellClassName: (params) => {
      return params.value === 'Add Feed'
        ? 'blue-text'
        : params.value === 'Consume Feed'
        ? 'red-text'
        : ''
    },
  },
  {
    field: 'quantity',
    headerName: 'Quantity',
    flex: 1,
    minWidth: 120,
    resizable: false,
    headerAlign: 'right',
    align: 'right',

    cellClassName: (params) => {
      const action = params.row.action
      return action === 'Add Feed'
        ? 'blue-text'
        : action === 'Consume Feed'
        ? 'red-text'
        : ''
    },
  },
  {
    field: 'target',
    headerName: 'Target Pig',
    flex: 1,
    minWidth: 130,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'date',
    headerName: 'Date',
    flex: 1,
    minWidth: 120,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'cost',
    headerName: 'Cost',
    flex: 1,
    minWidth: 100,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
  },
]

const initialRows = [
  {
    id: 1,
    medType: 'Monensin',
    action: 'Add Feed',
    quantity: '+25kg',
    target: '002',
    date: 'Jun 25, 2024',
    cost: 'Php875',
  },
  {
    id: 2,
    medType: 'Biogesic',
    action: 'Consume Feed',
    quantity: '-25kg',
    target: '003',
    date: 'Jun 8, 2024',
    cost: 'Php875',
  },
  {
    id: 3,
    medType: 'Neozep',
    action: 'Consume Feed',
    quantity: '-25kg',
    target: '004',
    date: 'Jun 18, 2024',
    cost: 'Php75',
  },
]

const paginationModel = { page: 0, pageSize: 5 }

export default function FeedInvDataTable() {
  const [searchText, setSearchText] = React.useState('')
  const [statusFilter, setStatusFilter] = React.useState('all')
  const [filteredRows, setFilteredRows] = React.useState(initialRows)

  const handleFilter = () => {
    const lowerSearchText = searchText.toLowerCase()
    const filtered = initialRows.filter((row) => {
      const matchesSearch =
        row.medType.toLowerCase().includes(lowerSearchText) ||
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
            direction: 'row',
            paddingTop: 2
          }}
        >
          <TextField
            label="Search"
            variant="outlined"
            size="small"
            fullWidth
            value={searchText}
            onChange={(e) => setSearchText(e.target.value)}
            sx={{ width: { xs: 150, sm: 250, md: 300, lg: 320, xl: 350 } }}
          />
          <FormControl sx={{ minWidth: 150, marginLeft: 2 }}>
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
                  Add Feed
                </Box>
              </MenuItem>
              <MenuItem value="Consume Feed">
                <Box sx={{ display: 'flex', alignItems: 'center' }}>
                  Consume Feed
                </Box>
              </MenuItem>
            </Select>
          </FormControl>
        </Box>

        <Box
          sx={{
            width: '100%',
            overflowX: 'auto',
            textAlign: 'start',
            display: 'grid',
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
            disableColumnMenu
            slotProps={{
              toolbar: {
                showQuickFilter: false,
              },
            }}
            slots={{ toolbar: GridToolbar }}
            sx={{
              '& .MuiDataGrid-columnHeaders': {
                fontWeight: 'bold',
                fontSize: '15px',
                color: '#222222',
              },
              '& .MuiDataGrid-toolbarContainer .MuiButtonBase-root': {
                color: '#3B4DE1',
              },
              '& .blue-text': {
                color: '#3B4DE1',
              },
              '& .red-text': {
                color: 'red',
              },
              '& .even-row': {
                backgroundColor: '#E1EDFB',
              },
            }}
          />
        </Box>
      </Grid2>
    </ThemeProvider>
  )
}
