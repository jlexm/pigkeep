import * as React from 'react';
import { DataGrid, GridColDef, GridToolbar } from '@mui/x-data-grid';
import Grid2 from '@mui/material/Grid2';
import { Box, TextField, ThemeProvider } from '@mui/material';
import '../PigList_Folder/PigList.css';
import theme from '../../../Theme';

// Define the columns for the DataGrid
const columns: GridColDef[] = [
  {
    field: 'penNumber',
    headerName: 'Number',
    flex: 1,
    minWidth: 115,
    resizable: false,
  },
  {
    field: 'penType',
    headerName: 'Type',
    flex: 1,
    minWidth: 90,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'currentPigCount',
    headerName: 'Pig Count',
    flex: 1,
    minWidth: 125,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
    renderCell: (params: any) => {
      return <>{params.row.pigs?.length ?? 0}</>;
    },
  },
  {
    field: 'maxPigCount',
    headerName: 'Max Pigs',
    flex: 1,
    minWidth: 120,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
  },
];

// Define the pagination model
const paginationModel = { page: 0, pageSize: 5 };

export default function PigpenDataTable({
  pens,
  onRowSelect,
}: {
  pens: any[];
  onRowSelect?: (row: any) => void;
}) {
  const [searchText, setSearchText] = React.useState('');
  const [filteredRows, setFilteredRows] = React.useState<any[]>([]);

  React.useEffect(() => {
    setFilteredRows(pens);
  }, [pens]);

  // Function to handle filtering based on searchText
  const handleFilter = React.useCallback(() => {
    const lowerSearchText = searchText.toLowerCase();
    const filtered = pens.filter((row) =>
      row.penNumber.toLowerCase().includes(lowerSearchText)
    );
    setFilteredRows(filtered);
  }, [searchText]);

  // Trigger filter whenever searchText changes
  React.useEffect(() => {
    handleFilter();
  }, [searchText, handleFilter]);

  return (
    <ThemeProvider theme={theme}>
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
            sx={{ width: { xs: 200, sm: 250, md: 300, lg: 320, xl: 350 } }}
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
            initialState={{ pagination: { paginationModel } }}
            getRowId={(row) => row.uuid}
            pageSizeOptions={[5, 10, 25, 50, 100]}
            rowSelection={true}
            getRowClassName={(params) =>
              params.indexRelativeToCurrentPage % 2 === 0
                ? 'even-row'
                : 'odd-row'
            }
            onRowClick={(rowData) => {
              onRowSelect?.(rowData.row); // Pass clicked row data to parent
            }}
            slotProps={{
              toolbar: {
                showQuickFilter: false,
              },
            }}
            disableColumnMenu
            slots={{ toolbar: GridToolbar }}
            sx={{
              '& .MuiDataGrid-columnHeaders': {
                fontWeight: 'bold',
                fontSize: '15px',
                color: '#222222',
              },
              '& .MuiDataGrid-toolbarContainer .MuiButtonBase-root': {
                color: '#11703B',
              },
            }}
          />
        </Box>
      </Grid2>
    </ThemeProvider>
  );
}
