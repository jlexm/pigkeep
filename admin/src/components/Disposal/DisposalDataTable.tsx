import * as React from 'react';
import { DataGrid, GridColDef, GridToolbar } from '@mui/x-data-grid';
import { Box, Grid2, TextField, ThemeProvider } from '@mui/material';
import theme from '../../Theme';
import { formatCurrency, formatDate } from '../../services/utils.service';

// Define the columns for the DataGrid
const columns: GridColDef[] = [
  {
    field: 'pigNumber',
    headerName: 'Pig Number',
    flex: 1,
    minWidth: 140,
    resizable: false,
  },
  {
    field: 'status',
    headerName: 'Status',
    flex: 1,
    minWidth: 110,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
    cellClassName: (params) =>
      params.value === 'deceased'
        ? 'red-text'
        : params.value === 'sold'
        ? 'green-text'
        : '',
  },
  {
    field: 'transactionDate',
    headerName: 'Date',
    flex: 1,
    minWidth: 100,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
    renderCell: (params) => (
      <>{formatDate(new Date(params.row.transactionDate))}</>
    ),
  },
  {
    field: 'weightKG',
    headerName: 'Weight',
    flex: 1,
    minWidth: 110,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
    renderCell: (params) => (
      <>{params.row.weightKG ? params.row.weightKG + 'KG' : 'N/A'}</>
    ),
  },

  {
    field: 'priceSold',
    headerName: 'Price',
    flex: 1,
    minWidth: 90,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
    renderCell: (params) => (
      <>{formatCurrency(params.row.priceSold || 'N/A')}</>
    ),
  },
];

// Define the pagination model
export default function DisposalDataTable({ ledgers }: { ledgers: any[] }) {
  const [searchText, setSearchText] = React.useState('');
  const [filteredRows, setFilteredRows] = React.useState<any[]>([]);
  const [paginationModel, setPaginationModel] = React.useState({
    page: 0,
    pageSize: 5,
  });

  React.useEffect(() => {
    setFilteredRows(ledgers);
  }, [ledgers]);

  // Function to handle filtering based on searchText
  const handleFilter = React.useCallback(() => {
    const lowerSearchText = searchText.toLowerCase();
    const filtered = ledgers.filter((row) => {
      return (
        !lowerSearchText ||
        (row.pigNumber && row.pigNumber.toLowerCase().includes(lowerSearchText))
      );
    });
    setFilteredRows(filtered);
  }, [searchText]);

  // Trigger filter whenever searchText changes
  React.useEffect(() => {
    handleFilter();
  }, [searchText, handleFilter]);

  // Function to handle pagination changes
  const handlePaginationChange = (
    newModel: React.SetStateAction<{ page: number; pageSize: number }>
  ) => {
    setPaginationModel(newModel);
  };

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
            initialState={{
              sorting: {
                sortModel: [{ field: 'transactionDate', sort: 'desc' }],
              },
            }}
            rowSelection={false}
            getRowId={(row) => row.uuid}
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
                color: '#554F91',
              },
              '& .green-text': {
                color: '#11703b',
              },
              '& .red-text': {
                color: 'red',
              },
              '& .even-row': {
                backgroundColor: '#EBE9FF',
              },
            }}
          />
        </Box>
      </Grid2>
    </ThemeProvider>
  );
}
