import * as React from 'react'
import { DataGrid, GridColDef, GridToolbar } from '@mui/x-data-grid'
import { Box, Grid2, TextField, ThemeProvider } from '@mui/material'
import theme from '../../Theme'

// Define the columns for the DataGrid
const columns: GridColDef[] = [
  {
    field: 'number',
    headerName: 'Pig Number',
    minWidth: 234,
    resizable: false,
  },
  {
    field: 'status',
    headerName: 'Status',
    minWidth: 234,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
    cellClassName: (params) =>
      params.value === 'Deceased'
        ? 'red-text'
        : params.value === 'Sold'
        ? 'green-text'
        : '',
  },
  {
    field: 'date',
    headerName: 'Date',
    minWidth: 234,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'weight',
    headerName: 'Weight',
    minWidth: 234,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
  },

  {
    field: 'price',
    headerName: 'Price',
    minWidth: 234,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
  },
]

// Define the initial rows with pig arrays (to be passed to another component)
const initialRows = [
  {
    id: 1,
    number: '005',
    status: 'Sold',
    date: 'Jul 2, 2024',
    weight: 105,
    price: 12000,
  },
  {
    id: 2,
    number: '002',
    status: 'Deceased',
    date: 'Jul 3, 2024',
    weight: null,
    price: null,
  },
  {
    id: 3,
    number: '006',
    status: 'Sold',
    date: 'Jul 4, 2024',
    weight: 101,
    price: 11000,
  },
  {
    id: 4,
    number: '001',
    status: 'Deceased',
    date: 'Jul 6, 2024',
    weight: null,
    price: null,
  },
  {
    id: 5,
    number: '009',
    status: 'Sold',
    date: 'Jul 21, 2024',
    weight: 108,
    price: 10000,
  },
  {
    id: 6,
    number: '008',
    status: 'Sold',
    date: 'Jul 23, 2024',
    weight: 109,
    price: 9000,
  },
  {
    id: 1,
    number: '005',
    status: 'Sold',
    date: 'Jul 2, 2024',
    weight: 105,
    price: 12000,
  },
  {
    id: 2,
    number: '002',
    status: 'Deceased',
    date: 'Jul 3, 2024',
    weight: null,
    price: null,
  },
  {
    id: 3,
    number: '006',
    status: 'Sold',
    date: 'Jul 4, 2024',
    weight: 101,
    price: 11000,
  },
  {
    id: 4,
    number: '001',
    status: 'Deceased',
    date: 'Jul 6, 2024',
    weight: null,
    price: null,
  },
  {
    id: 5,
    number: '009',
    status: 'Sold',
    date: 'Jul 21, 2024',
    weight: 108,
    price: 10000,
  },
  {
    id: 6,
    number: '008',
    status: 'Sold',
    date: 'Jul 23, 2024',
    weight: 109,
    price: 9000,
  },
  {
    id: 1,
    number: '005',
    status: 'Sold',
    date: 'Jul 2, 2024',
    weight: 105,
    price: 12000,
  },
  {
    id: 2,
    number: '002',
    status: 'Deceased',
    date: 'Jul 3, 2024',
    weight: null,
    price: null,
  },
  {
    id: 3,
    number: '006',
    status: 'Sold',
    date: 'Jul 4, 2024',
    weight: 101,
    price: 11000,
  },
  {
    id: 4,
    number: '001',
    status: 'Deceased',
    date: 'Jul 6, 2024',
    weight: null,
    price: null,
  },
  {
    id: 5,
    number: '009',
    status: 'Sold',
    date: 'Jul 21, 2024',
    weight: 108,
    price: 10000,
  },
  {
    id: 6,
    number: '008',
    status: 'Sold',
    date: 'Jul 23, 2024',
    weight: 109,
    price: 9000,
  },
]

// Define the pagination model
export default function DisposalDataTable() {
  const [searchText, setSearchText] = React.useState('')
  const [filteredRows, setFilteredRows] = React.useState(initialRows)
  const [paginationModel, setPaginationModel] = React.useState({
    page: 0,
    pageSize: 5,
  })

  // Function to handle filtering based on searchText
  const handleFilter = React.useCallback(() => {
    const lowerSearchText = searchText.toLowerCase()
    const filtered = initialRows.filter((row) => {
      return (
        (row.number && row.number.toLowerCase().includes(lowerSearchText)) ||
        (row.date && row.date.toLowerCase().includes(lowerSearchText)) ||
        (row.weight !== null &&
          row.weight.toString().includes(lowerSearchText)) ||
        (row.status && row.status.toLowerCase().includes(lowerSearchText)) ||
        (row.price !== null && row.price.toString().includes(lowerSearchText))
      )
    })
    setFilteredRows(filtered)
  }, [searchText])

  // Trigger filter whenever searchText changes
  React.useEffect(() => {
    handleFilter()
  }, [searchText, handleFilter])

  // Function to handle pagination changes
  const handlePaginationChange = (
    newModel: React.SetStateAction<{ page: number; pageSize: number }>
  ) => {
    setPaginationModel(newModel)
  }

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
            onPaginationModelChange={handlePaginationChange}
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
                color: '#11703B',
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
    </ThemeProvider>
  )
}
