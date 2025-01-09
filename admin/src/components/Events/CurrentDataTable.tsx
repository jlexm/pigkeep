import * as React from 'react';
import { DataGrid, GridColDef, GridToolbar } from '@mui/x-data-grid';
import {
  Box,
  Grid2,
  IconButton,
  TextField,
  ThemeProvider,
  Typography,
} from '@mui/material';
import EditIcon from '@mui/icons-material/Edit';
import DeleteIcon from '@mui/icons-material/Delete';
import ReusableDialogBox from '../../modals/ReusableDialogBox'; // Adjust the import path as needed
import theme from '../../Theme';
import { useEffect } from 'react';
import { formatDate } from '../../services/utils.service';

// Define the columns for the DataGrid
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
    // Apply green text color when status is 'In Progress'
    cellClassName: () => 'green-text',
    renderCell: () => <>In Progress</>,
  },
  // {
  //   field: 'actions',
  //   headerName: 'Actions',
  //   flex: 1,
  //   minWidth: 110,
  //   resizable: false,
  //   renderCell: (params) => {
  //     // eslint-disable-next-line react-hooks/rules-of-hooks
  //     const [editDialogOpen, setEditDialogOpen] = React.useState(false)
  //     // eslint-disable-next-line react-hooks/rules-of-hooks
  //     const [deleteDialogOpen, setDeleteDialogOpen] = React.useState(false) // State for delete dialog visibility
  //     const pigNumber = params.row.number

  //     const handleEditClick = () => {
  //       setEditDialogOpen(true)
  //     }

  //     const handleSave = () => {
  //       setEditDialogOpen(false)
  //     }

  //     const handleCancelEdit = () => {
  //       setEditDialogOpen(false)
  //     }

  //     const handleDeleteClick = () => {
  //       setDeleteDialogOpen(true)
  //     }

  //     const handleConfirmDelete = () => {
  //       // Perform delete logic here
  //       setDeleteDialogOpen(false)
  //     }

  //     const handleCancelDelete = () => {
  //       setDeleteDialogOpen(false)
  //     }

  //     return (
  //       <>
  //         <IconButton
  //           sx={{ color: 'blue' }}
  //           size="small"
  //           onClick={handleEditClick}
  //         >
  //           <EditIcon />
  //         </IconButton>
  //         <IconButton
  //           sx={{ color: 'red' }}
  //           size="small"
  //           onClick={handleDeleteClick}
  //         >
  //           <DeleteIcon />
  //         </IconButton>

  //         {editDialogOpen && (
  //           <ReusableDialogBox
  //             title="Update Event"
  //             description="Fill up the form to update the event."
  //             formFields={[
  //               { placeholder: 'Date', icon: <EditIcon /> },
  //               { placeholder: 'Pig Number', icon: <EditIcon /> },
  //               { placeholder: 'Event Name', icon: <EditIcon /> },
  //             ]}
  //             onSave={handleSave}
  //             onCancel={handleCancelEdit}
  //             saveButtonText="Save"
  //             saveButtonColor="#3B4DE1"
  //           />
  //         )}

  //         {deleteDialogOpen && (
  //           <ReusableDialogBox
  //             title={
  //               <>
  //                 Delete Event{' '}
  //                 <span style={{ color: '#FF0000' }}>{pigNumber}</span>{' '}
  //               </>
  //             }
  //             description="Confirm that you would like to proceed with the deletion of this event. Note that this action is irreversible."
  //             formFields={[]}
  //             onSave={handleConfirmDelete}
  //             onCancel={handleCancelDelete}
  //             saveButtonText="Delete"
  //             saveButtonColor="#FF0000"
  //           />
  //         )}
  //       </>
  //     )
  //   },
  //   headerAlign: 'right',
  //   align: 'right',
  // },
];

// Define the pagination model
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

  // Function to handle filtering based on searchText
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

  // Trigger filter whenever searchText changes
  React.useEffect(() => {
    handleFilter();
  }, [searchText, handleFilter]);

  // Function to handle cell click and open dialog if the "Status" column is clicked
  const handleCellClick = (params: any) => {
    if (params.field === 'status') {
      setSelectedRow(params.row); // Set the selected row data
      setOpenDialog(true); // Open dialog
    }
  };

  // Function to close the dialog
  const handleCloseDialog = () => {
    setOpenDialog(false);
    setSelectedRow(null); // Reset selected row data
  };

  // Mark as done event code here
  const handleSave = () => {
    console.log('Saving event data...');
    handleCloseDialog(); // Close dialog after saving
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
              pageSizeOptions={[10, 25, 50, 100]}
              rowSelection={false}
              onCellClick={handleCellClick} // Add cell click event
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
                  color: '#11703B', // Style for "In Progress" status
                },
                '& .red-text': {
                  color: 'red',
                },
              }}
            />
          </Box>
        </Grid2>

        {/* ReusableDialogBox to be shown when openDialog is true */}
        {/*  {openDialog && selectedRow && (
          <ReusableDialogBox
            title="Accomplished?"
            description="Verify if the event has been accomplished."
            formFields={[]}
            onSave={handleSave} // Handle save action
            onCancel={handleCloseDialog} // Handle cancel action
            saveButtonText="Mark as Done"
            saveButtonColor="#11703B" // Green color for the save button
          />
        )} */}
      </Grid2>
    </ThemeProvider>
  );
}
