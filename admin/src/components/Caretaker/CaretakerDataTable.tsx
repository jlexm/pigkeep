import * as React from 'react';
import { DataGrid, GridColDef, GridToolbar } from '@mui/x-data-grid';

import EditIcon from '@mui/icons-material/Edit';
import DeleteIcon from '@mui/icons-material/Delete';
import VisibilityIcon from '@mui/icons-material/Visibility';
import VisibilityOffIcon from '@mui/icons-material/VisibilityOff';
import {
  Box,
  Grid2,
  TextField,
  IconButton,
  TableContainer,
  ThemeProvider,
} from '@mui/material';
import ReusableDialogBox from '../../modals/ReusableDialogBox';
import theme from '../../Theme';
import { Lock, Person, Phone } from '@mui/icons-material';

interface CareTakerTableProps {
  rows: any[];
  onCaretakerSave?: (caretaker: any) => Promise<void>;
}

const paginationModel = { page: 0, pageSize: 5 };

export default function CaretakerDataTable(props: CareTakerTableProps) {
  const [caretakerForm, setCaretakerForm] = React.useState({
    username: '',
    first_name: '',
    last_name: '',
    phone_number: '',
    password: '',
    confirm_password: '',
  });

  const [searchText, setSearchText] = React.useState('');
  const [filteredRows, setFilteredRows] = React.useState<any[]>([]);
  const [visiblePasswords, setVisiblePasswords] = React.useState<
    Record<number, boolean>
  >({});

  React.useEffect(() => {
    setFilteredRows(props.rows);
  }, [props.rows]);

  // toggle password visibility
  const togglePasswordVisibility = (id: number) => {
    setVisiblePasswords((prevVisiblePasswords) => ({
      ...prevVisiblePasswords,
      [id]: !prevVisiblePasswords[id],
    }));
  };

  // filtering searchText
  const handleFilter = () => {
    const lowerSearchText = searchText.toLowerCase();
    const filtered = props.rows.filter((row: any) => {
      return (
        row.username.toLowerCase().includes(lowerSearchText) ||
        row.phone_number.toLowerCase().includes(lowerSearchText)
      );
    });
    setFilteredRows(filtered);
  };

  React.useEffect(() => {
    handleFilter();
  }, [searchText]);

  // generate columns
  const columns: (
    visiblePasswords: Record<number, boolean>,
    togglePasswordVisibility: (id: number) => void
  ) => GridColDef[] = (visiblePasswords, togglePasswordVisibility) => [
    {
      field: 'username',
      headerName: 'Username',
      flex: 1,
      minWidth: 130,
      resizable: false,
    },
    {
      field: 'first_name',
      headerName: 'First Name',
      flex: 1,
      minWidth: 150,
      resizable: false,
      headerAlign: 'left',
      align: 'left',
    },
    {
      field: 'last_name',
      headerName: 'Last Name',
      flex: 1,
      minWidth: 150,
      resizable: false,
      headerAlign: 'left',
      align: 'left',
    },
    {
      field: 'phone_number',
      headerName: 'Phone Number',
      flex: 1,
      minWidth: 170,
      resizable: false,
      headerAlign: 'right',
      align: 'right',
    },
    {
      field: 'actions',
      headerName: 'Actions',
      flex: 1,
      minWidth: 110,
      resizable: false,
      renderCell: (params) => {
        // eslint-disable-next-line react-hooks/rules-of-hooks
        const [editDialogOpen, setEditDialogOpen] = React.useState(false);
        // eslint-disable-next-line react-hooks/rules-of-hooks
        const [deleteDialogOpen, setDeleteDialogOpen] = React.useState(false);
        const pigNumber = params.row.number;

        const handleEditClick = () => {
          setCaretakerForm({
            ...params.row,
            password: '',
            confirm_password: '',
          });
          setEditDialogOpen(true);
        };

        const handleSave = async () => {
          await props.onCaretakerSave?.(caretakerForm);
          setEditDialogOpen(false);
        };

        const handleCancelEdit = () => {
          setEditDialogOpen(false);
        };

        const handleDeleteClick = () => {
          setDeleteDialogOpen(true);
        };

        const handleConfirmDelete = () => {
          // delete logic
          setDeleteDialogOpen(false);
        };

        const handleCancelDelete = () => {
          setDeleteDialogOpen(false);
        };

        return (
          <>
            <IconButton
              sx={{ color: 'blue' }}
              size="small"
              onClick={handleEditClick}
            >
              <EditIcon />
            </IconButton>
            {editDialogOpen && (
              <ReusableDialogBox
                title="Edit Caretaker"
                description="Fill up the form to edit a caretaker’s information."
                formFields={[
                  {
                    placeholder: 'Username',
                    disabled: true,
                    icon: <Person />,
                    type: 'text',
                    value: caretakerForm.username,
                    onChange: (v) =>
                      setCaretakerForm((prev) => ({ ...prev, username: v })),
                  },
                  {
                    placeholder: 'First name',
                    icon: <Person />,
                    type: 'text',
                    value: caretakerForm.first_name,
                    onChange: (v) =>
                      setCaretakerForm((prev) => ({ ...prev, first_name: v })),
                  },
                  {
                    placeholder: 'Last name',
                    icon: <Person />,
                    type: 'text',
                    value: caretakerForm.last_name,
                    onChange: (v) =>
                      setCaretakerForm((prev) => ({ ...prev, last_name: v })),
                  },
                  {
                    placeholder: 'Phone Number',
                    slotProps: { htmlInput: { maxLength: 11 } },
                    icon: <Phone />,
                    type: 'text',
                    value: caretakerForm.phone_number,
                    onChange: (v) =>
                      setCaretakerForm((prev) => ({
                        ...prev,
                        phone_number: v,
                      })),
                  },
                  {
                    placeholder: 'Password',
                    icon: <Lock />,
                    type: 'password',
                    value: caretakerForm.password,
                    onChange: (v) =>
                      setCaretakerForm((prev) => ({ ...prev, password: v })),
                  },
                  {
                    placeholder: 'Confirm Password',
                    icon: <Lock />,
                    type: 'password',
                    value: caretakerForm.confirm_password,
                    onChange: (v) =>
                      setCaretakerForm((prev) => ({
                        ...prev,
                        confirm_password: v,
                      })),
                  },
                ]}
                onSave={handleSave}
                onCancel={handleCancelEdit}
                saveButtonText="Save"
                saveButtonColor="#3B4DE1"
              />
            )}

            {deleteDialogOpen && (
              <ReusableDialogBox
                title="Remove Caretaker"
                description="Confirm that you would like to proceed with the deletion of this caretaker. Note that this action is irreversible."
                formFields={[]}
                onSave={handleConfirmDelete}
                onCancel={handleCancelDelete}
                saveButtonText="Delete"
                saveButtonColor="#FF0000"
              />
            )}
          </>
        );
      },
      headerAlign: 'right',
      align: 'right',
    },
  ];

  return (
    <ThemeProvider theme={theme}>
      <TableContainer>
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
              columns={columns(visiblePasswords, togglePasswordVisibility)}
              initialState={{ pagination: { paginationModel } }}
              pageSizeOptions={[5, 10, 25, 50, 100]}
              rowSelection={false}
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
                  color: 'green',
                },
                '& .red-text': {
                  color: 'red',
                },
                width: '100%',
              }}
              getRowId={(row) => row.username}
            />
          </Box>
        </Grid2>
      </TableContainer>
    </ThemeProvider>
  );
}
