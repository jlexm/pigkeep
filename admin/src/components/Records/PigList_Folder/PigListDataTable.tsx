import * as React from 'react';
import { DataGrid, GridColDef, GridToolbar } from '@mui/x-data-grid';
import Grid2 from '@mui/material/Grid2';
import Button from '@mui/material/Button';
import {
  Box,
  TextField,
  MenuItem,
  Select,
  InputLabel,
  FormControl,
  ThemeProvider,
  Typography,
} from '@mui/material';
import '../PigList_Folder/PigList.css';
import theme from '../../../Theme';
import { formatCurrency } from '../../../services/utils.service';

const paginationModel = { page: 0, pageSize: 5 };

export default function PigListDataTable({
  data = [],
  onPigDownload,
}: {
  data?: any[];
  onPigDownload?: (row: any) => void;
}) {
  const columns: GridColDef[] = [
    {
      field: 'pigNumber',
      headerName: 'Number',
      flex: 1,
      minWidth: 115,
      resizable: false,
      renderCell: (params) => {
        const statusColor = {
          alive: 'blue',
          sold: 'green',
          deceased: 'red',
        }[params.row.status as string];

        return (
          <Box sx={{ display: 'flex', alignItems: 'center' }}>
            <Box
              sx={{
                width: 12,
                height: 12,
                borderRadius: '50%',
                backgroundColor: statusColor,
                marginRight: 1,
              }}
            />
            {params.row.pigNumber}
          </Box>
        );
      },
    },
    {
      field: 'dob',
      headerName: 'Date of\nBirth',
      flex: 1,
      minWidth: 120,
      resizable: false,
      headerClassName: 'recorded-weight-header',
      renderCell: (params) => {
        return (
          <Box sx={{ display: 'flex', alignItems: 'center', height: '100%' }}>
            <Typography>
              {new Date(params.row.dob).toLocaleDateString('en-US', {
                year: 'numeric',
                month: 'long',
                day: 'numeric',
              })}
            </Typography>
          </Box>
        );
      },
    },
    {
      field: 'age',
      headerName: 'Age',
      flex: 1,
      minWidth: 105,
      resizable: false,
      headerClassName: 'recorded-weight-header',
    },
    {
      field: 'stage',
      headerName: 'Age Category',
      flex: 1,
      minWidth: 120,
      resizable: false,
      headerClassName: 'recorded-weight-header',
    },
    {
      field: 'sex',
      headerName: 'Sex',
      flex: 1,
      minWidth: 80,
      resizable: false,
      renderCell: (params) => {
        return (
          <Box sx={{ display: 'flex', alignItems: 'center', height: '100%' }}>
            <Typography>{params.row.sex ? 'Male' : 'Female'}</Typography>
          </Box>
        );
      },
    },
    {
      field: 'parentUuid',
      headerName: 'Parent Number',
      flex: 1,
      minWidth: 115,
      resizable: false,
      headerClassName: 'recorded-weight-header',
      renderCell: (params) => (
        <>{params.row.parentPigDetails?.[0]?.pigNumber}</>
      ),
    },
    {
      field: 'feed',
      headerName: 'Current Feed',
      flex: 1,
      minWidth: 110,
      resizable: false,
      headerClassName: 'recorded-weight-header',
    },
    {
      field: 'penUuid',
      headerName: 'Pigpen Number',
      flex: 1,
      minWidth: 115,
      resizable: false,
      headerClassName: 'recorded-weight-header',
      renderCell: (params) => <>{params.row.penDetails?.[0]?.penNumber}</>,
    },
    {
      field: 'weightKG',
      headerName: 'Recorded\nWeight (kg)',
      flex: 1,
      minWidth: 145,
      resizable: false,
      headerClassName: 'recorded-weight-header',
    },
    {
      field: 'priceSold',
      headerName: 'Price Sold',
      flex: 1,
      minWidth: 90,
      resizable: false,
      headerClassName: 'recorded-weight-header',
      renderCell: (params) => {
        return (
          <Box sx={{ display: 'flex', alignItems: 'center', height: '100%' }}>
            <Typography>
              {formatCurrency(
                params.row.ledgerDetails?.[0]?.priceSold ?? 'N/A'
              )}
            </Typography>
          </Box>
        );
      },
    },
    {
      field: 'qrCode',
      headerName: 'QR Code',
      flex: 1,
      minWidth: 105,
      resizable: false,
      renderCell: (params) => (
        <Button
          variant="text"
          size="small"
          sx={{ color: '#F25B0C' }}
          onClick={() => onPigDownload?.(params.row)}
        >
          <Typography fontSize={12}>Download</Typography>
        </Button>
      ),
      headerClassName: 'recorded-weight-header',
      headerAlign: 'right',
      align: 'right',
    },
  ];

  const [searchText, setSearchText] = React.useState('');
  const [statusFilter, setStatusFilter] = React.useState('all');

  const filteredRows = data.filter((row) => {
    const matchesSearchText = Object.values(row).some((value) =>
      value
        ? value.toString().toLowerCase().includes(searchText.toLowerCase())
        : false
    );
    const matchesStatus = statusFilter === 'all' || row.status === statusFilter;
    return matchesSearchText && matchesStatus;
  });

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container justifyContent="start">
        <Box
          sx={{
            marginBottom: 2,
            minWidth: { xs: 30, lg: 590 },
            paddingTop: 1,
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
          <FormControl sx={{ width: 150, marginLeft: 2 }}>
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
              <MenuItem value="alive">
                <Box sx={{ display: 'flex', alignItems: 'center' }}>
                  <Box
                    sx={{
                      width: 12,
                      height: 12,
                      borderRadius: '50%',
                      backgroundColor: 'blue',
                      marginRight: 1,
                    }}
                  />
                  Alive
                </Box>
              </MenuItem>
              <MenuItem value="sold">
                <Box sx={{ display: 'flex', alignItems: 'center' }}>
                  <Box
                    sx={{
                      width: 12,
                      height: 12,
                      borderRadius: '50%',
                      backgroundColor: 'green',
                      marginRight: 1,
                    }}
                  />
                  Sold
                </Box>
              </MenuItem>
              <MenuItem value="deceased">
                <Box sx={{ display: 'flex', alignItems: 'center' }}>
                  <Box
                    sx={{
                      width: 12,
                      height: 12,
                      borderRadius: '50%',
                      backgroundColor: 'red',
                      marginRight: 1,
                    }}
                  />
                  Deceased
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
            paddingBottom: 1,
            display: 'grid',
          }}
        >
          <DataGrid
            columns={columns}
            rows={filteredRows}
            getRowId={(row) => row.uuid}
            pageSizeOptions={[5, 10, 25, 50, 100]}
            initialState={{ pagination: { paginationModel } }}
            slotProps={{
              toolbar: {
                showQuickFilter: false,
              },
            }}
            disableColumnMenu
            disableRowSelectionOnClick
            slots={{ toolbar: GridToolbar }}
            sx={{
              '& .MuiListItemText-root': {
                color: '#222222',
              },
              '& .MuiDataGrid-toolbarContainer .MuiButtonBase-root': {
                color: '#11703B',
              },
              '& .MuiButton-root:hover': {
                color: '#222222',
              },
            }}
          />
        </Box>
      </Grid2>
    </ThemeProvider>
  );
}
