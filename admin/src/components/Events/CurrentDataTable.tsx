import * as React from 'react'
import { DataGrid, GridColDef } from '@mui/x-data-grid'
import { Box, Grid2, IconButton, TextField } from '@mui/material'
import EditIcon from '@mui/icons-material/Edit'
import DeleteIcon from '@mui/icons-material/Delete'

// Define the columns for the DataGrid
const columns: GridColDef[] = [
  { field: 'evName', headerName: 'Event Name', flex: 1.3 },
  {
    field: 'date',
    headerName: 'Date',
    flex: 0.8,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'pigNum',
    headerName: 'Pig Number',
    flex: 0.8,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'status',
    headerName: 'Status',
    flex: 0.8,
    headerAlign: 'right',
    align: 'right',
    // Apply green text color when status is 'In Progress'
    cellClassName: (params) =>
      params.value === 'In Progress' ? 'green-text' : '',
  },
  {
    field: 'actions',
    headerName: 'Actions',
    flex: 0.7,
    renderCell: () => (
      <>
        <IconButton sx={{ color: 'blue' }} size="small">
          <EditIcon />
        </IconButton>
        <IconButton sx={{ color: 'red' }} size="small">
          <DeleteIcon />
        </IconButton>
      </>
    ),
    headerAlign: 'right',
    align: 'right',
  },
]

// Define the initial rows with pig arrays (to be passed to another component)
const initialRows = [
  {
    id: 1,
    evName: 'Vaccination',
    date: 'Jul 2, 2024',
    pigNum: 5,
    status: 'In Progress',
  },
  {
    id: 2,
    evName: 'Artificial Insemination',
    date: 'Jul 3, 2024',
    pigNum: 3,
    status: 'In Progress',
  },
  {
    id: 3,
    evName: 'Farrow',
    date: 'Jul 4, 2024',
    pigNum: 1,
    status: 'In Progress',
  },
  {
    id: 4,
    evName: 'Artificial Insemination',
    date: 'Jul 6, 2024',
    pigNum: 7,
    status: 'In Progress',
  },
  {
    id: 5,
    evName: 'Artificial Insemination',
    date: 'Jul 21, 2024',
    pigNum: 8,
    status: 'In Progress',
  },
  {
    id: 6,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 9,
    status: 'In Progress',
  },
  {
    id: 1,
    evName: 'Vaccination',
    date: 'Jul 2, 2024',
    pigNum: 5,
    status: 'In Progress',
  },
  {
    id: 2,
    evName: 'Artificial Insemination',
    date: 'Jul 3, 2024',
    pigNum: 3,
    status: 'In Progress',
  },
  {
    id: 3,
    evName: 'Farrow',
    date: 'Jul 4, 2024',
    pigNum: 1,
    status: 'In Progress',
  },
  {
    id: 4,
    evName: 'Artificial Insemination',
    date: 'Jul 6, 2024',
    pigNum: 7,
    status: 'In Progress',
  },
  {
    id: 5,
    evName: 'Artificial Insemination',
    date: 'Jul 21, 2024',
    pigNum: 8,
    status: 'In Progress',
  },
  {
    id: 6,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 9,
    status: 'In Progress',
  },
  {
    id: 1,
    evName: 'Vaccination',
    date: 'Jul 2, 2024',
    pigNum: 5,
    status: 'In Progress',
  },
  {
    id: 2,
    evName: 'Artificial Insemination',
    date: 'Jul 3, 2024',
    pigNum: 3,
    status: 'In Progress',
  },
  {
    id: 3,
    evName: 'Farrow',
    date: 'Jul 4, 2024',
    pigNum: 1,
    status: 'In Progress',
  },
  {
    id: 4,
    evName: 'Artificial Insemination',
    date: 'Jul 6, 2024',
    pigNum: 7,
    status: 'In Progress',
  },
  {
    id: 5,
    evName: 'Artificial Insemination',
    date: 'Jul 21, 2024',
    pigNum: 8,
    status: 'In Progress',
  },
  {
    id: 6,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 9,
    status: 'In Progress',
  },
]

// Define the pagination model
const paginationModel = { page: 0, pageSize: 5 }

export default function CurrentDataTable() {
  const [searchText, setSearchText] = React.useState('')
  const [filteredRows, setFilteredRows] = React.useState(initialRows)

  // Function to handle filtering based on searchText
  const handleFilter = React.useCallback(() => {
    const lowerSearchText = searchText.toLowerCase()
    const filtered = initialRows.filter((row) => {
      return (
        row.evName.toLowerCase().includes(lowerSearchText) ||
        row.date.toLowerCase().includes(lowerSearchText) ||
        row.pigNum.toString().includes(lowerSearchText) || // Convert pigNum to string for filtering
        row.status.toLowerCase().includes(lowerSearchText)
      )
    })
    setFilteredRows(filtered)
  }, [searchText])

  // Trigger filter whenever searchText changes
  React.useEffect(() => {
    handleFilter()
  }, [searchText, handleFilter])

  return (
    <Grid2 container size={12}>
     <Grid2 size={12} className="lefty">
          <p className="margin0">Current Events</p>
        </Grid2>
      <Grid2 size={12}>
        <Box
          sx={{
            marginBottom: 2,
            minWidth: 50,
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
          />
        </Box>

        <Box>
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
                color: 'green', // Style for "In Progress" status
              },
              '& .red-text': {
                color: 'red',
              },
            }}
          />
        </Box>
      </Grid2>
    </Grid2>
  )
}
