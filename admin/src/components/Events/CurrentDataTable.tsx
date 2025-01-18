import * as React from 'react';
import { DataGrid, GridColDef, GridToolbar } from '@mui/x-data-grid';
import {
  Box,
  Grid2,
  TextField,
  ThemeProvider,
  Typography,
} from '@mui/material';
import theme from '../../Theme';
import { useEffect } from 'react';
import { formatDate } from '../../services/utils.service';

const columns: GridColDef[] = [
  {
    field: 'eventType',
    headerName: 'Event Name',
    flex: 1,
    minWidth: 160,
    resizable: false,
  },
  {
    field: 'eventDate',
    headerName: 'Date',
    flex: 1,
    minWidth: 100,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
    renderCell: (params) => <>{formatDate(new Date(params.value))}</>,
  },
  {
    field: 'pigNumber',
    headerName: 'Pig Number',
    flex: 1,
    minWidth: 140,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'status',
    headerName: 'Status',
    flex: 1,
    minWidth: 100,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
    // if status is 'In Progress'
    cellClassName: () => 'green-text',
    renderCell: () => <>In Progress</>,
  },
];

// pagination model
const paginationModel = { page: 0, pageSize: 10 };

export default function CurrentDataTable({
  currentEvents,
}: {
  currentEvents: any[];
}) {
  const [searchText, setSearchText] = React.useState('');
  const [filteredRows, setFilteredRows] = React.useState<any[]>([]);
  const [openDialog, setOpenDialog] = React.useState(false);
  const [selectedRow, setSelectedRow] = React.useState<unknown | null>(null);

  useEffect(() => {
    setFilteredRows(currentEvents);
  }, [currentEvents]);

  // handle filtering searchText
  const handleFilter = React.useCallback(() => {
    const lowerSearchText = searchText.toLowerCase();
    const filtered = currentEvents.filter((row) => {
      return (
        row.eventType.toLowerCase().includes(lowerSearchText) ||
        row.pigNumber.toLowerCase().includes(lowerSearchText)
      );
    });
    setFilteredRows(filtered);
  }, [searchText]);

  React.useEffect(() => {
    handleFilter();
  }, [searchText, handleFilter]);

  // cell click and open dialog
  const handleCellClick = (params: any) => {
    if (params.field === 'status') {
      setSelectedRow(params.row);
      setOpenDialog(true);
    }
  };

  // close the dialog
  const handleCloseDialog = () => {
    setOpenDialog(false);
    setSelectedRow(null);
  };

  // mark as done event
  const handleSave = () => {
    console.log('Saving event data...');
    handleCloseDialog();
  };

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container size={12}>
        <Grid2 size={12} className="lefty">
          <Typography variant="h4" fontWeight={500}>
            Current Events
          </Typography>
        </Grid2>
        <Grid2 size={12}>
          <Box
            sx={{
              marginBottom: 2,
              maxWidth: '100%',
              paddingTop: 1.5,
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
              initialState={{
                pagination: { paginationModel },
                sorting: { sortModel: [{ field: 'eventDate', sort: 'asc' }] },
              }}
              getRowId={(row) => row.uuid}
              pageSizeOptions={[5, 10, 25, 50, 100]}
              rowSelection={false}
              onCellClick={handleCellClick}
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
                  color: '#11703B',
                },
                '& .green-text': {
                  color: '#11703B',
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
  );
}
