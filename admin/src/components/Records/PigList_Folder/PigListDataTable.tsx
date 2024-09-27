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
  Paper,
} from '@mui/material'
import EditIcon from '@mui/icons-material/Edit'
import DeleteIcon from '@mui/icons-material/Delete'
import ReusableDialogBox from '../../../modals/ReusableDialogBox' // Import the reusable dialog box
import '../PigList_Folder/PigList.css'

const columns: GridColDef[] = [
  {
    field: 'number',
    headerName: 'Number',
    flex: 1,
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
  { field: 'dob', headerName: 'Date of Birth', flex: 1 },
  { field: 'ageDays', headerName: 'Age (Days)', type: 'number', flex: 1 },
  { field: 'ageCategory', headerName: 'Age Category', flex: 1 },
  { field: 'sex', headerName: 'Sex', flex: 1 },
  { field: 'parentNumber', headerName: 'Parent Number', flex: 1 },
  { field: 'currentFeed', headerName: 'Current Feed', flex: 1 },
  { field: 'pigpenNumber', headerName: 'Pigpen Number', flex: 1 },
  { field: 'recordedWeight', headerName: 'Recorded Weight (kg)', flex: 1.2 },
  { field: 'priceSold', headerName: 'Price Sold', flex: 1 },
  {
    field: 'qrCode',
    headerName: 'QR Code',
    flex: 0.8,
    renderCell: () => (
      <Button variant="text" size="small" sx={{ color: '#F25B0C' }}>
        Download
      </Button>
    ),
  },
  {
    field: 'actions',
    headerName: 'Actions',
    flex: 0.7,
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
              title={
                <>
                  Edit Pig <span style={{ color: '#11703b' }}>{pigNumber}</span>{' '}
                </>
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
    <>
      <Grid2 container size={{ xs: 12 }}>
        <Box
          sx={{
            marginBottom: 2,
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
          <FormControl sx={{ minWidth: 150, marginLeft: 2 }}>
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

        {/* <Paper sx={{ height: 400, width: '100%' }}>
        <DataGrid
          rows={filteredRows}
          columns={columns}
          initialState={{ pagination: { paginationModel } }}
          pageSizeOptions={[5, 10, 25, 50, 100]}
          rowSelection={false}
          getRowClassName={(params) =>
            params.indexRelativeToCurrentPage % 2 === 0 ? 'even-row' : 'odd-row'
          }
          disableColumnMenu
        />
      </Paper> */}
      </Grid2>
      <Grid2 sx={{ overflow: 'scroll' }} size={{ md: 6 }}>
        <DataGrid
          rows={rows}
          columns={columns}
          initialState={{ pagination: { paginationModel } }}
          pageSizeOptions={[5, 10]}
          checkboxSelection
          sx={{ border: 0, width: '100%' }}
        />
      </Grid2>
    </>
  )
}
