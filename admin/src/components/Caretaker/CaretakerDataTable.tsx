import * as React from 'react'
import { DataGrid, GridColDef, GridToolbar } from '@mui/x-data-grid'

import EditIcon from '@mui/icons-material/Edit'
import DeleteIcon from '@mui/icons-material/Delete'
import VisibilityIcon from '@mui/icons-material/Visibility'
import VisibilityOffIcon from '@mui/icons-material/VisibilityOff'
import {
  Box,
  Grid2,
  TextField,
  IconButton,
  TableContainer,
  ThemeProvider,
} from '@mui/material'
import ReusableDialogBox from '../../modals/ReusableDialogBox'
import theme from '../../Theme'

interface CareTakerTableProps {
  rows: any[]
}

// Function to generate columns
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
    field: 'password',
    headerName: 'Password',
    flex: 1,
    minWidth: 130,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
    renderCell: (params) => {
      const isPasswordVisible = visiblePasswords[params.row._id] || false
      return (
        <>
          <span>
            {isPasswordVisible ? params.value : '•'.repeat(Math.min(12, params.value.length))}
          </span>
          <IconButton
            sx={{ paddingRight: 0 }}
            onClick={() => togglePasswordVisibility(params.row._id)}
          >
            {isPasswordVisible ? <VisibilityOffIcon /> : <VisibilityIcon />}
          </IconButton>
        </>
      )
    },
  },
  {
    field: 'actions',
    headerName: 'Actions',
    flex: 1,
    minWidth: 110,
    resizable: false,
    renderCell: (params) => {
      // eslint-disable-next-line react-hooks/rules-of-hooks
      const [editDialogOpen, setEditDialogOpen] = React.useState(false)
      // eslint-disable-next-line react-hooks/rules-of-hooks
      const [deleteDialogOpen, setDeleteDialogOpen] = React.useState(false) // State for delete dialog visibility
      const pigNumber = params.row.number

      const handleEditClick = () => {
        setEditDialogOpen(true)
      }

      const handleSave = () => {
        setEditDialogOpen(false)
      }

      const handleCancelEdit = () => {
        setEditDialogOpen(false)
      }

      const handleDeleteClick = () => {
        setDeleteDialogOpen(true)
      }

      const handleConfirmDelete = () => {
        // Perform delete logic here
        setDeleteDialogOpen(false)
      }

      const handleCancelDelete = () => {
        setDeleteDialogOpen(false)
      }

      return (
        <>
          <IconButton
            sx={{ color: 'blue' }}
            size="small"
            onClick={handleEditClick}
          >
            <EditIcon />
          </IconButton>
          <IconButton
            sx={{ color: 'red' }}
            size="small"
            onClick={handleDeleteClick}
          >
            <DeleteIcon />
          </IconButton>

          {editDialogOpen && (
            <ReusableDialogBox
              title="Edit Caretaker"
              description="Fill up the form to edit a caretaker’s information."
              formFields={[
                { placeholder: 'Email', icon: <EditIcon /> },
                { placeholder: 'Username', icon: <EditIcon /> },
                { placeholder: 'Phone Number', icon: <EditIcon /> },
                { placeholder: 'Password', icon: <EditIcon /> },
                { placeholder: 'Confirm Password', icon: <EditIcon /> },
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
      )
    },
    headerAlign: 'right',
    align: 'right',
  },
]

const initialRows = [
  {
    id: 1,
    username: 'John Shi',
    email: 'johnshi@gmail.com',
    phoneNum: '09214356843',
    password: '123434',
    phone_number: '123'
  },
  {
    id: 2,
    username: 'John Dei',
    email: 'johndei@gmail.com',
    phoneNum: '09123456789',
    password: 'wgwagrga',
  },
  {
    id: 3,
    username: 'John Lee',
    email: 'johnlee@gmail.com',
    phoneNum: '09192408183',
    password: 'owugbjkljklgs',
  },
  {
    id: 4,
    username: 'Tee Hee',
    email: 'teehee@gmail.com',
    phoneNum: '09598374185',
    password: 'gikpwshnerfgol;wsjkg',
  },
]

const paginationModel = { page: 0, pageSize: 5 }

export default function CaretakerDataTable(props: CareTakerTableProps) {

  const [searchText, setSearchText] = React.useState('')
  const [filteredRows, setFilteredRows] = React.useState<any[]>([])
  const [visiblePasswords, setVisiblePasswords] = React.useState<
    Record<number, boolean>
  >({})

  React.useEffect(() => {
    setFilteredRows(props.rows)
  }, [props.rows])

  // Function to toggle password visibility for a specific row
  const togglePasswordVisibility = (id: number) => {
    setVisiblePasswords((prevVisiblePasswords) => ({
      ...prevVisiblePasswords,
      [id]: !prevVisiblePasswords[id],
    }))
  }

  // Function to handle filtering based on searchText (excluding password)
  const handleFilter = () => {
    const lowerSearchText = searchText.toLowerCase()
    const filtered = props.rows.filter((row: any) => {
      return (
        row.username.toLowerCase().includes(lowerSearchText) ||
        row.phone_number.toLowerCase().includes(lowerSearchText)
      )
    })
    setFilteredRows(filtered)
  }

  React.useEffect(() => {
    handleFilter()
  }, [searchText])

  

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
  )
}
