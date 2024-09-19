import * as React from 'react'
import { DataGrid, GridColDef } from '@mui/x-data-grid'
import { Box, Grid2, IconButton, TextField } from '@mui/material'
import EditIcon from '@mui/icons-material/Edit'
import DeleteIcon from '@mui/icons-material/Delete'

// Define the columns for the DataGrid
const columns: GridColDef[] = [
  { field: 'evName', headerName: 'Event Name', flex: 1 },
  {
    field: 'date',
    headerName: 'Date',
    flex:1,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'pigNum',
    headerName: 'Pig Number',
    flex: 1,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'actions',
    headerName: 'Actions',
    flex: 1,
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
    evName: 'Artificial Insemination',
    date: 'Jul 22, 2024',
    pigNum: 5,
  },
  {
    id: 2,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 3,
  },
  {
    id: 3,
    evName: 'Artificial Insemination',
    date: 'Jul 24, 2024',
    pigNum: 1,
  },
  {
    id: 4,
    evName: 'Artificial Insemination',
    date: 'Jul 26, 2024',
    pigNum: 7,
  },
  {
    id: 5,
    evName: 'Farrow',
    date: 'Jul 31, 2024',
    pigNum: 8,
  },
  {
    id: 6,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 9,
  },
  {
    id: 1,
    evName: 'Artificial Insemination',
    date: 'Jul 22, 2024',
    pigNum: 5,
  },
  {
    id: 2,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 3,
  },
  {
    id: 3,
    evName: 'Artificial Insemination',
    date: 'Jul 24, 2024',
    pigNum: 1,
  },
  {
    id: 4,
    evName: 'Artificial Insemination',
    date: 'Jul 26, 2024',
    pigNum: 7,
  },
  {
    id: 5,
    evName: 'Farrow',
    date: 'Jul 31, 2024',
    pigNum: 8,
  },
  {
    id: 6,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 9,
  },
  {
    id: 1,
    evName: 'Artificial Insemination',
    date: 'Jul 22, 2024',
    pigNum: 5,
  },
  {
    id: 2,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 3,
  },
  {
    id: 3,
    evName: 'Artificial Insemination',
    date: 'Jul 24, 2024',
    pigNum: 1,
  },
  {
    id: 4,
    evName: 'Artificial Insemination',
    date: 'Jul 26, 2024',
    pigNum: 7,
  },
  {
    id: 5,
    evName: 'Farrow',
    date: 'Jul 31, 2024',
    pigNum: 8,
  },
  {
    id: 6,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 9,
  },


]

// Define the pagination model
const paginationModel = { page: 0, pageSize: 5 }

export default function UpcomingDataTable() {
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
    <Grid2 container size={12}>
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
  )
}
