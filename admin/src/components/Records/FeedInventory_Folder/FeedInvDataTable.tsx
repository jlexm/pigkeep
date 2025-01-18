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
  Typography,
} from '@mui/material'
import { ThemeProvider } from '@emotion/react'
import theme from '../../../Theme'
import { useEffect } from 'react'

const columns: GridColDef[] = [
  {
    field: 'feedType',
    headerName: 'Feed Type',
    flex: 1,
    minWidth: 130,
    resizable: false,
  },
  {
    field: 'status',
    headerName: 'Action',
    flex: 1,
    minWidth: 130,
    resizable: false,
    headerAlign: 'left',
    align: 'left',
    cellClassName: (params) => {
      return params.value === 'stock'
        ? 'green-text'
        : params.value === 'consumed'
        ? 'red-text'
        : ''
    },
  },
  {
    field: 'weightKG',
    headerName: 'Quantity',
    flex: 1,
    minWidth: 120,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
    renderCell(params) {
      return (
        <>
          {params.value} KG
        </>
      )
    },
  },
  {
    field: 'createdAt',
    headerName: 'Date',
    flex: 1,
    minWidth: 130,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
    renderCell(params) {
      return (
        <>
          {new Date(params.value).toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' })}
        </>
      )
    },
  },
  {
    field: 'cost',
    headerName: 'Cost',
    flex: 1,
    minWidth: 115,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
    renderCell(params) {
      return (
        <>
          {params.value.toLocaleString('en-PH', { style: 'currency', currency: 'PHP' })}
        </>
      )
    },
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

const paginationModel = { page: 0, pageSize: 10 }

export default function FeedInvDataTable( { feedHistory }: { feedHistory: any[] }) {

  const [searchText, setSearchText] = React.useState('')
  const [statusFilter, setStatusFilter] = React.useState('all')
  const [filteredRows, setFilteredRows] = React.useState<any[]>([])

  useEffect(() => {
    setFilteredRows(feedHistory)
  }, [feedHistory])

  const handleFilter = () => {
    const lowerSearchText = searchText.toLowerCase()
    const filtered = feedHistory.filter((row) => {
      const matchesSearch =
        row.feedType.toLowerCase().includes(lowerSearchText) ||
        row.status.toLowerCase().includes(lowerSearchText) ||
        row.weightKG.toString().toLowerCase().includes(lowerSearchText) ||
        row.createdAt.toLowerCase().includes(lowerSearchText) ||
        row.cost.toString().toLowerCase().includes(lowerSearchText)
      const matchesStatus =
        statusFilter === 'all' || row.status === statusFilter
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
          }}
        >
          <TextField
            label="Search"
            variant="outlined"
            size="small"
            value={searchText}
            onChange={(e) => setSearchText(e.target.value)}
            sx={{ width: { xs: 150, sm: 250, md: 300, lg: 320, xl: 350 } }}
          />
          <FormControl sx={{ minWidth: 190, marginLeft: 2 }}>
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
              <MenuItem value="stock">
                <Box sx={{ display: 'flex', alignItems: 'center' }}>
                  <Typography>Stock</Typography>
                </Box>
              </MenuItem>
              <MenuItem value="consumed">
                <Box sx={{ display: 'flex', alignItems: 'center' }}>
                  <Typography>Consumed</Typography>
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
            getRowId={(row) => row.uuid}
            initialState={{ pagination: { paginationModel } }}
            pageSizeOptions={[10, 25, 50, 100]}
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
              '& .green-text': {
                color: '#11703B',
              },
              '& .red-text': {
                color: 'red',
              },
              '& .MuiListItemText-root': {
                color: '#222222',
              },
              '& .MuiDataGrid-toolbarContainer .MuiButtonBase-root': {
                color: '#11703B',
              },
              '& .MuiButton-root:hover': {
                color: '#222222',
              },
            }}
          />
        </Box>
      </Grid2>
    </ThemeProvider>
  )
}
