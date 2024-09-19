import * as React from 'react'
import { DataGrid, GridColDef } from '@mui/x-data-grid'
import Grid2 from '@mui/material/Grid2'
import { Box, TextField } from '@mui/material'

import '../PigList_Folder/PigList.css'

// Define the columns for the DataGrid
const columns: GridColDef[] = [
  { field: 'number', headerName: 'Number', flex: 1 },
  {
    field: 'type',
    headerName: 'Type',
    flex: 1,
    headerAlign: 'right',
    align: 'right',
    cellClassName: (params) => {
      const action = params.row.action
      return action === 'Add Feed'
        ? 'green-text'
        : action === 'Consume Feed'
        ? 'red-text'
        : ''
    },
  },
  {
    field: 'pigCount',
    headerName: 'Pig Count',
    flex: 1,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'maxPigs',
    headerName: 'Max Pigs',
    flex: 1,
    headerAlign: 'right',
    align: 'right',
  },
]

// Define the initial rows with pig arrays (to be passed to another component)
const initialRows = [
  {
    id: 1,
    number: 'P-01',
    type: 'Nursery',
    pigCount: '7',
    maxPigs: '7',
    pigs: ['001', '002', '003', '004', '005', '006', '007'], // Pig numbers array
  },
  {
    id: 2,
    number: 'P-02',
    type: 'Stall',
    pigCount: '3',
    maxPigs: '5',
    pigs: ['008', '009', '010'], // Pig numbers array
  },
  {
    id: 3,
    number: 'P-03',
    type: 'Farrowing',
    pigCount: '1',
    maxPigs: '1',
    pigs: ['011'], // Pig numbers array
  },
  {
    id: 4,
    number: 'P-04',
    type: 'Nursery',
    pigCount: '7',
    maxPigs: '7',
    pigs: ['012', '013', '014', '015', '016', '017', '018'], // Pig numbers array
  },
  {
    id: 5,
    number: 'P-05',
    type: 'Stall',
    pigCount: '3',
    maxPigs: '6',
    pigs: ['019', '020', '021'], // Pig numbers array
  },
  {
    id: 6,
    number: 'P-06',
    type: 'Farrowing',
    pigCount: '1',
    maxPigs: '2',
    pigs: ['022'], // Pig numbers array
  },
  
]

// Define the pagination model
const paginationModel = { page: 0, pageSize: 5 }

export default function PigpenDataTable() {
  const [searchText, setSearchText] = React.useState('')
  const [filteredRows, setFilteredRows] = React.useState(initialRows)

  // Function to handle filtering based on searchText
  const handleFilter = React.useCallback(() => {
    const lowerSearchText = searchText.toLowerCase()
    const filtered = initialRows.filter(
      (row) =>
        row.number.toLowerCase().includes(lowerSearchText) ||
        row.type.toLowerCase().includes(lowerSearchText) ||
        row.pigCount.toLowerCase().includes(lowerSearchText) ||
        row.maxPigs.toLowerCase().includes(lowerSearchText)
    )
    setFilteredRows(filtered)
  }, [searchText])

  // Trigger filter whenever searchText changes
  React.useEffect(() => {
    handleFilter()
  }, [searchText, handleFilter])

  return (
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
            params.indexRelativeToCurrentPage % 2 === 0 ? 'even-row' : 'odd-row'
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
  )
}


