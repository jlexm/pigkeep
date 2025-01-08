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
import { useEffect } from 'react'

const columns: GridColDef[] = [
  {
    field: 'medicineName',
    headerName: 'Medicine Name',
    flex: 1,
    minWidth: 170,
    resizable: false,
  },
  {
    field: 'status',
    headerName: 'Action',
    flex: 1,
    minWidth: 140,
    resizable: false,
    headerAlign: 'left',
    align: 'left',

    cellClassName: (params) => {
      return params.value === 'stock'
        ? 'blue-text'
        : params.value === 'consumed'
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
      return action === 'stock'
        ? 'blue-text'
        : action === 'consumed'
        ? 'red-text'
        : ''
    },
    renderCell(params) {
      return (
        <>
          {params.value} x {params.row.dosage}
        </>
      )
    }
  },
  {
    field: 'pigUuid',
    headerName: 'Target Pig',
    flex: 1,
    minWidth: 130,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'createdAt',
    headerName: 'Date',
    flex: 1,
    minWidth: 120,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
    renderCell(params) {
      return (
        <>
          {new Date(params.value).toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'long',
            day: 'numeric',
          })}
        </>
      )
    }
  },
  {
    field: 'cost',
    type: 'number',
    headerName: 'Cost',
    flex: 1,
    minWidth: 100,
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
  {
    field: 'totalCost',
    type: 'number',
    headerName: 'Total Cost',
    flex: 1,
    minWidth: 100,
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

const paginationModel = { page: 0, pageSize: 10 }

export default function MedInvDataTable({ medicineHistory }: { medicineHistory: any[] }) {
  const [searchText, setSearchText] = React.useState('')
  const [statusFilter, setStatusFilter] = React.useState('all')
  const [filteredRows, setFilteredRows] = React.useState<any[]>([])

  useEffect(() => {
    setFilteredRows(medicineHistory)
  }, [medicineHistory])

  const handleFilter = () => {
    const lowerSearchText = searchText.toLowerCase()
    const filtered = medicineHistory.filter((row) => {
      const matchesSearch =
        row.medicineName.toLowerCase().includes(lowerSearchText)
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
              <MenuItem value="stock">
                <Box sx={{ display: 'flex', alignItems: 'center' }}>
                  Stock
                </Box>
              </MenuItem>
              <MenuItem value="consumed">
                <Box sx={{ display: 'flex', alignItems: 'center' }}>
                  Consumed
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
            getRowId={(row) => row.uuid}
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
