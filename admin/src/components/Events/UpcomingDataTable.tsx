import * as React from 'react'
import { DataGrid, GridColDef, GridToolbar } from '@mui/x-data-grid'
import { Box, Grid2, IconButton, TextField, ThemeProvider } from '@mui/material'
import EditIcon from '@mui/icons-material/Edit'
import DeleteIcon from '@mui/icons-material/Delete'
import ReusableDialogBox from '../../modals/ReusableDialogBox'
import theme from '../../Theme'

// Define the columns for the DataGrid
const columns: GridColDef[] = [
  {
    field: 'evName',
    headerName: 'Event Name',
    flex: 1,
    minWidth: 160,
    resizable: false,
  },
  {
    field: 'date',
    headerName: 'Date',
    flex: 1,
    minWidth: 100,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
  },
  {
    field: 'pigNum',
    headerName: 'Pig Number',
    flex: 1,
    minWidth: 140,
    resizable: false,
    headerAlign: 'right',
    align: 'right',
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
]

// Define the initial rows with pig arrays (to be passed to another component)
const initialRows = [
  {
    id: 1,
    evName: 'Artificial Insemination',
    date: 'Jul 22, 2024',
    pigNum: 5,
  },
  {
    id: 2,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 3,
  },
  {
    id: 3,
    evName: 'Artificial Insemination',
    date: 'Jul 24, 2024',
    pigNum: 1,
  },
  {
    id: 4,
    evName: 'Artificial Insemination',
    date: 'Jul 26, 2024',
    pigNum: 7,
  },
  {
    id: 5,
    evName: 'Farrow',
    date: 'Jul 31, 2024',
    pigNum: 8,
  },
  {
    id: 6,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 9,
  },
  {
    id: 1,
    evName: 'Artificial Insemination',
    date: 'Jul 22, 2024',
    pigNum: 5,
  },
  {
    id: 2,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 3,
  },
  {
    id: 3,
    evName: 'Artificial Insemination',
    date: 'Jul 24, 2024',
    pigNum: 1,
  },
  {
    id: 4,
    evName: 'Artificial Insemination',
    date: 'Jul 26, 2024',
    pigNum: 7,
  },
  {
    id: 5,
    evName: 'Farrow',
    date: 'Jul 31, 2024',
    pigNum: 8,
  },
  {
    id: 6,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 9,
  },
  {
    id: 1,
    evName: 'Artificial Insemination',
    date: 'Jul 22, 2024',
    pigNum: 5,
  },
  {
    id: 2,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 3,
  },
  {
    id: 3,
    evName: 'Artificial Insemination',
    date: 'Jul 24, 2024',
    pigNum: 1,
  },
  {
    id: 4,
    evName: 'Artificial Insemination',
    date: 'Jul 26, 2024',
    pigNum: 7,
  },
  {
    id: 5,
    evName: 'Farrow',
    date: 'Jul 31, 2024',
    pigNum: 8,
  },
  {
    id: 6,
    evName: 'Vaccination',
    date: 'Jul 23, 2024',
    pigNum: 9,
  },
]

// Define the pagination model
const paginationModel = { page: 0, pageSize: 5 }

export default function UpcomingDataTable() {
  const [searchText, setSearchText] = React.useState('')
  const [filteredRows, setFilteredRows] = React.useState(initialRows)

  // Function to handle filtering based on searchText
  const handleFilter = React.useCallback(() => {
    const lowerSearchText = searchText.toLowerCase()
    const filtered = initialRows.filter((row) => {
      return (
        row.evName.toLowerCase().includes(lowerSearchText) ||
        row.date.toLowerCase().includes(lowerSearchText) ||
        row.pigNum.toString().includes(lowerSearchText)
      )
    })
    setFilteredRows(filtered)
  }, [searchText])

  // Trigger filter whenever searchText changes
  React.useEffect(() => {
    handleFilter()
  }, [searchText, handleFilter])

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container size={12}>
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
              }}
            />
          </Box>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  )
}
