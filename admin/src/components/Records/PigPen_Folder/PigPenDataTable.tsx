import * as React from 'react'
import { DataGrid, GridColDef } from '@mui/x-data-grid'
import Paper from '@mui/material/Paper'
import { Box, TextField } from '@mui/material'

import '../PigList_Folder/PigList.css'

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

const initialRows = [
  {
    id: 1,
    number: 'P-01',
    type: 'Nursery',
    pigCount: '7',
    maxPigs: '7',
  },
  {
    id: 2,
    number: 'P-02',
    type: 'Stall',
    pigCount: '3',
    maxPigs: '5',
  },
  {
    id: 3,
    number: 'P-03',
    type: 'Farrowing',
    pigCount: '1',
    maxPigs: '1',
  },
  {
    id: 4,
    number: 'P-04',
    type: 'Nursery',
    pigCount: '7',
    maxPigs: '7',
  },
  {
    id: 5,
    number: 'P-05',
    type: 'Stall',
    pigCount: '3',
    maxPigs: '6',
  },
  {
    id: 6,
    number: 'P-06',
    type: 'Farrowing',
    pigCount: '1',
    maxPigs: '2',
  },
  
]

const paginationModel = { page: 0, pageSize: 5 }

export default function PigpenDataTable() {
  const [searchText, setSearchText] = React.useState('')
  const [filteredRows, setFilteredRows] = React.useState(initialRows)

  // Function to handle filtering based on searchText
  const handleFilter = React.useCallback(() => {
    const lowerSearchText = searchText.toLowerCase()
    const filtered = initialRows.filter((row) =>
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
    <Paper sx={{ height: '100%', width: '100%', position: 'relative' }}>
      <Box
        sx={{
          margin: 2,
          width: 590,
          paddingTop: 2,
          display: 'flex',
          alignItems: 'center',
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
    </Paper>
  )
}
