import * as React from 'react'
import { DataGrid, GridColDef } from '@mui/x-data-grid'
import Grid2 from '@mui/material/Grid2'
import Button from '@mui/material/Button'
import {
  Box,
  IconButton,
  TextField,
  MenuItem,
  Select,
  InputLabel,
  FormControl,
  ThemeProvider,
  Typography,
} from '@mui/material'
import EditIcon from '@mui/icons-material/Edit'
import DeleteIcon from '@mui/icons-material/Delete'
import ReusableDialogBox from '../../../modals/ReusableDialogBox' // Import the reusable dialog box
import '../PigList_Folder/PigList.css'
import theme from '../../../Theme'

const columns: GridColDef[] = [
  {
    field: 'number',
    headerName: 'Number',
    flex: 1, // Prevents the column from growing
    minWidth: 100, // Ensures it doesn't shrink too small
    renderCell: (params) => {
      const statusColor = {
        alive: 'blue',
        sold: 'green',
        deceased: 'red',
      }[params.row.status]

      const paddedNumber = params.value.toString().padStart(3, '0')

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
          {paddedNumber}
        </Box>
      )
    },
  },
  { field: 'dob', headerName: 'Date of Birth', flex: 1, minWidth: 100 },
  { field: 'ageDays', headerName: 'Age (Days)', flex: 1, minWidth: 100 },
  { field: 'ageCategory', headerName: 'Age Category', flex: 1, minWidth: 100 },
  { field: 'sex', headerName: 'Sex', flex: 1, minWidth: 80 },
  { field: 'parentNumber', headerName: 'Parent Number', flex: 1, minWidth: 100 },
  { field: 'currentFeed', headerName: 'Current Feed', flex: 1, minWidth: 100 },
  { field: 'pigpenNumber', headerName: 'Pigpen Number', flex: 1, minWidth: 100 },
  { field: 'recordedWeight', headerName: 'Recorded Weight (kg)', flex: 1, minWidth: 100 },
  { field: 'priceSold', headerName: 'Price Sold', flex: 1, minWidth: 100 },
  {
    field: 'qrCode',
    headerName: 'QR Code',
    flex: 1,
    minWidth: 100,
    renderCell: () => (
      <Button variant="text" size="small" sx={{ color: '#F25B0C' }}>
        Download
      </Button>
    ),
  },
  {
    field: 'actions',
    headerName: 'Actions',
    flex: 1,
    minWidth: 100,
    renderCell: (params) => {
      const [editDialogOpen, setEditDialogOpen] = React.useState(false)
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
              title={
                <Typography variant="h4" fontWeight={700}>
                  Edit Pig <span style={{ color: '#11703b' }}>{pigNumber}</span>{' '}
                </Typography>
              }
              description="Fill up the form to update the pig’s information."
              formFields={[
                { placeholder: 'Date of Birth', icon: <EditIcon /> },
                { placeholder: 'Parent Number', icon: <EditIcon /> },
                { placeholder: 'Sex', icon: <EditIcon /> },
                { placeholder: 'Pen Number', icon: <EditIcon /> },
                { placeholder: 'Weight in kg', icon: <EditIcon /> },
              ]}
              onSave={handleSave}
              onCancel={handleCancelEdit}
              saveButtonText="Update"
              saveButtonColor="#3B4DE1"
            />
          )}

          {deleteDialogOpen && (
            <ReusableDialogBox
              title={
                <>
                  Delete Pig{' '}
                  <span style={{ color: '#FF0000' }}>{pigNumber}</span>{' '}
                </>
              }
              description="Confirm that you would like to proceed with the deletion of the pig. Note that this action is irreversible."
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


const rows = [
  {
    id: 1,
    number: 1,
    dob: '2023-01-01',
    ageDays: 250,
    ageCategory: 'Matured',
    sex: 'Male',
    parentNumber: 101,
    currentFeed: 'Feed A',
    pigpenNumber: 12,
    recordedWeight: null,
    priceSold: null,
    status: 'alive',
  },
  {
    id: 2,
    number: 2,
    dob: '2023-02-15',
    ageDays: 220,
    ageCategory: 'Weaner',
    sex: 'Female',
    parentNumber: 102,
    currentFeed: 'Feed B',
    pigpenNumber: 13,
    recordedWeight: 150,
    priceSold: 12000,
    status: 'sold',
  },
  {
    id: 3,
    number: 3,
    dob: '2023-03-05',
    ageDays: 180,
    ageCategory: 'Grower',
    sex: 'Male',
    parentNumber: 103,
    currentFeed: 'Feed C',
    pigpenNumber: 14,
    recordedWeight: 160,
    priceSold: null,
    status: 'deceased',
  },
  {
    id: 4,
    number: 4,
    dob: '2023-04-12',
    ageDays: 150,
    ageCategory: 'Grower',
    sex: 'Female',
    parentNumber: 104,
    currentFeed: 'Feed D',
    pigpenNumber: 15,
    recordedWeight: 140,
    priceSold: null,
    status: 'sold',
  },
  {
    id: 5,
    number: 5,
    dob: '2023-05-22',
    ageDays: 120,
    ageCategory: 'Weaner',
    sex: 'Male',
    parentNumber: 105,
    currentFeed: 'Feed E',
    pigpenNumber: 16,
    recordedWeight: 120,
    priceSold: 21200,
    status: 'sold',
  },
  {
    id: 6,
    number: 6,
    dob: '2023-01-01',
    ageDays: 250,
    ageCategory: 'Matured',
    sex: 'Male',
    parentNumber: 101,
    currentFeed: 'Feed A',
    pigpenNumber: 12,
    recordedWeight: null,
    priceSold: null,
    status: 'alive',
  },
  {
    id: 7,
    number: 7,
    dob: '2023-02-15',
    ageDays: 220,
    ageCategory: 'Weaner',
    sex: 'Female',
    parentNumber: 102,
    currentFeed: 'Feed B',
    pigpenNumber: 13,
    recordedWeight: 150,
    priceSold: 12000,
    status: 'sold',
  },
  {
    id: 8,
    number: 8,
    dob: '2023-03-05',
    ageDays: 180,
    ageCategory: 'Grower',
    sex: 'Male',
    parentNumber: 103,
    currentFeed: 'Feed C',
    pigpenNumber: 14,
    recordedWeight: 160,
    priceSold: null,
    status: 'deceased',
  },
  {
    id: 9,
    number: 9,
    dob: '2023-04-12',
    ageDays: 150,
    ageCategory: 'Grower',
    sex: 'Female',
    parentNumber: 104,
    currentFeed: 'Feed D',
    pigpenNumber: 15,
    recordedWeight: 140,
    priceSold: null,
    status: 'alive',
  },
  {
    id: 10,
    number: 10,
    dob: '2023-05-22',
    ageDays: 120,
    ageCategory: 'Weaner',
    sex: 'Male',
    parentNumber: 105,
    currentFeed: 'Feed E',
    pigpenNumber: 16,
    recordedWeight: 120,
    priceSold: 21200,
    status: 'alive',
  },
  {
    id: 11,
    number: 11,
    dob: '2023-01-01',
    ageDays: 250,
    ageCategory: 'Matured',
    sex: 'Male',
    parentNumber: 101,
    currentFeed: 'Feed A',
    pigpenNumber: 12,
    recordedWeight: null,
    priceSold: null,
    status: 'deceased',
  },
  {
    id: 12,
    number: 12,
    dob: '2023-02-15',
    ageDays: 220,
    ageCategory: 'Weaner',
    sex: 'Female',
    parentNumber: 102,
    currentFeed: 'Feed B',
    pigpenNumber: 13,
    recordedWeight: 150,
    priceSold: 12000,
    status: 'alive',
  },
  {
    id: 13,
    number: 13,
    dob: '2023-03-05',
    ageDays: 180,
    ageCategory: 'Grower',
    sex: 'Male',
    parentNumber: 103,
    currentFeed: 'Feed C',
    pigpenNumber: 14,
    recordedWeight: 160,
    priceSold: null,
    status: 'deceased',
  },
  {
    id: 14,
    number: 14,
    dob: '2023-04-12',
    ageDays: 150,
    ageCategory: 'Grower',
    sex: 'Female',
    parentNumber: 104,
    currentFeed: 'Feed D',
    pigpenNumber: 15,
    recordedWeight: 140,
    priceSold: null,
    status: 'sold',
  },
  {
    id: 15,
    number: 15,
    dob: '2023-05-22',
    ageDays: 12,
    ageCategory: 'Piglet',
    sex: 'Male',
    parentNumber: 105,
    currentFeed: 'Feed E',
    pigpenNumber: 16,
    recordedWeight: 120,
    priceSold: 21200,
    status: 'sold',
  },
]

const paginationModel = { page: 0, pageSize: 5 }

export default function DataTable() {
  const [searchText, setSearchText] = React.useState('')
  const [statusFilter, setStatusFilter] = React.useState('all')

  const filteredRows = rows.filter((row) => {
    const matchesSearchText = Object.values(row).some((value) =>
      value
        ? value.toString().toLowerCase().includes(searchText.toLowerCase())
        : false
    )
    const matchesStatus = statusFilter === 'all' || row.status === statusFilter
    return matchesSearchText && matchesStatus
  })

  return (
    <ThemeProvider theme={theme}>
    <Grid2 container  justifyContent="start" >
      <Box
        sx={{
          marginBottom: 2,
          minWidth: {xs: 30, lg: 590},
          paddingTop: 1,
          display: 'flex',
          alignItems: 'center',
          overflowX: 'auto',
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
        <FormControl sx={{ minWidth: 100, marginLeft: 2 }}>
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
    maxWidth: '2000px',
    overflowX: 'auto', 
    textAlign: 'start',
    paddingBottom: 1,
  }}
>
  <DataGrid
    columns={columns}
    rows={filteredRows}
    pageSizeOptions={[5, 10, 20]}
    paginationModel={paginationModel}
    autoHeight
    
  />
</Box>

    </Grid2>
  </ThemeProvider>
  )
}
