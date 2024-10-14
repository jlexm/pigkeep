import * as React from 'react'
import { DataGrid, GridColDef, GridToolbar } from '@mui/x-data-grid'
import { Box, Grid2, TextField, ThemeProvider } from '@mui/material'
import theme from '../../Theme'

// Define the columns for the DataGrid
const columns: GridColDef[] = [
  {
    field: 'evName',
    headerName: 'Event Name',
    minWidth: 216,
    resizable: false,
  },
  {
    field: 'date',
    headerName: 'Date',
    minWidth: 216,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'pigNum',
    headerName: 'Pig Number',
    minWidth: 216,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'status',
    headerName: 'Status',
    minWidth: 216,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
    cellClassName: (params) =>
      params.value === 'Done'
        ? 'red-text'
        : params.value === 'Done'
        ? 'green-text'
        : '',
  },
]

// Define the initial rows with pig arrays (to be passed to another component)
const initialRows = [
  {
    id: 1,
    evName: 'Artificial Insemination',
    date: 'Jun 22, 2024',
    pigNum: 15,
    status: 'Done',
  },
  {
    id: 2,
    evName: 'Vaccination',
    date: 'Jun 23, 2024',
    pigNum: 23,
    status: 'Done',
  },
  {
    id: 3,
    evName: 'Artificial Insemination',
    date: 'Jun 24, 2024',
    pigNum: 12,
    status: 'Done',
  },
  {
    id: 4,
    evName: 'Artificial Insemination',
    date: 'Jun 26, 2024',
    pigNum: 7,
    status: 'Done',
  },
  { id: 5, evName: 'Farrow', date: 'Jun 11, 2024', pigNum: 12, status: 'Done' },
  {
    id: 6,
    evName: 'Vaccination',
    date: 'Jun 23, 2024',
    pigNum: 4,
    status: 'Done',
  },
  {
    id: 1,
    evName: 'Artificial Insemination',
    date: 'Jun 22, 2024',
    pigNum: 15,
    status: 'Done',
  },
  {
    id: 2,
    evName: 'Vaccination',
    date: 'Jun 23, 2024',
    pigNum: 23,
    status: 'Done',
  },
  {
    id: 3,
    evName: 'Artificial Insemination',
    date: 'Jun 24, 2024',
    pigNum: 12,
    status: 'Done',
  },
  {
    id: 4,
    evName: 'Artificial Insemination',
    date: 'Jun 26, 2024',
    pigNum: 7,
    status: 'Done',
  },
  { id: 5, evName: 'Farrow', date: 'Jun 11, 2024', pigNum: 12, status: 'Done' },
  {
    id: 6,
    evName: 'Vaccination',
    date: 'Jun 23, 2024',
    pigNum: 4,
    status: 'Done',
  },
  {
    id: 1,
    evName: 'Artificial Insemination',
    date: 'Jun 22, 2024',
    pigNum: 15,
    status: 'Done',
  },
  {
    id: 2,
    evName: 'Vaccination',
    date: 'Jun 23, 2024',
    pigNum: 23,
    status: 'Done',
  },
  {
    id: 3,
    evName: 'Artificial Insemination',
    date: 'Jun 24, 2024',
    pigNum: 12,
    status: 'Done',
  },
  {
    id: 4,
    evName: 'Artificial Insemination',
    date: 'Jun 26, 2024',
    pigNum: 7,
    status: 'Done',
  },
  { id: 5, evName: 'Farrow', date: 'Jun 11, 2024', pigNum: 12, status: 'Done' },
  {
    id: 6,
    evName: 'Vaccination',
    date: 'Jun 23, 2024',
    pigNum: 4,
    status: 'Done',
  },
]

// Define the pagination model
const paginationModel = { page: 0, pageSize: 5 }

export default function HistoryDataTable() {
  const [searchText, setSearchText] = React.useState('')
  const [filteredRows, setFilteredRows] = React.useState(initialRows)

  // Function to handle filtering based on searchText
  const handleFilter = React.useCallback(() => {
    const lowerSearchText = searchText.toLowerCase()
    const filtered = initialRows.filter((row) => {
      return (
        row.evName.toLowerCase().includes(lowerSearchText) ||
        row.date.toLowerCase().includes(lowerSearchText) ||
        row.pigNum.toString().includes(lowerSearchText)
      )
    })
    setFilteredRows(filtered)
  }, [searchText])

  // Trigger filter whenever searchText changes
  React.useEffect(() => {
    handleFilter()
  }, [searchText, handleFilter])

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container size={12}>
        <Grid2 size={12}>
          <Box
            sx={{
              marginBottom: 2,
              maxWidth: '100%',
              paddingTop: 2,
              display: 'flex',
              alignItems: 'center',
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
              pagination
              paginationModel={paginationModel}
              pageSizeOptions={[5, 10, 25, 50, 100]}
              rowSelection={false}
              getRowClassName={(params) =>
                params.indexRelativeToCurrentPage % 2 === 0
                  ? 'even-row'
                  : 'odd-row'
              }
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
                  color: 'red',
                },
                '& .MuiDataGrid-toolbarContainer .MuiButtonBase-root': {
                  color: '#11703B',
                },
                '& .green-text': {
                  color: 'green',
                },
                '& .red-text': {
                  color: 'red',
                },
              }}
            />
          </Box>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  )
}
