import React, { useEffect, useState } from 'react'
import {
  Select,
  MenuItem,
  FormControl,
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  TextField,
  Typography,
  Grid2,
  ThemeProvider,
  Box,
  InputAdornment,
} from '@mui/material'
import theme from '../../Theme'
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike'
import { setSelectedFarm } from '../../services/farm.service'

interface DropdownWithAddButtonProps {
  options: any[]
  selected: any
  handleSetSelectedOption: (option: any) => void
  onAddNewItem: (newItem: string) => void
}

const DropdownWithAddButton: React.FC<DropdownWithAddButtonProps> = ({
  options,
  selected,
  handleSetSelectedOption,
  onAddNewItem,
}) => {
  const [selectedOption, setSelectedOption] = useState<any>(null) // Set default option
  const [openDialog, setOpenDialog] = useState(false)
  const [newItem, setNewItem] = useState('')

  useEffect(() => {
    setSelectedOption(selected)
  }, [selected])

  const handleChange = (event: React.ChangeEvent<{ value: unknown }>) => {
    const value = event.target.value as string

    if (value === 'add-new') {
      setOpenDialog(true) // Open the dialog for adding new items
    } else {
      setSelectedFarm(value)
      setSelectedOption(value) // Select the existing option
      handleSetSelectedOption(value)
    }
  }

  const handleAddNewItem = () => {
    if (newItem.trim()) {
      onAddNewItem(newItem)
      setSelectedOption(newItem) // Set new item as selected
      setNewItem('') // Reset the new item input
      setOpenDialog(false) // Close the dialog
    }
  }

  const handleCloseDialog = () => {
    setOpenDialog(false)
    setNewItem('') // Reset new item input on dialog close
  }

  return (
    <ThemeProvider theme={theme}>
      <Grid2>
        <FormControl fullWidth sx={{ padding: 0 }}>
          <Select
            value={selectedOption}
            onChange={handleChange}
            displayEmpty
            renderValue={(selected) =>
              selected ? (
                <span
                  style={{
                    fontWeight: 'bold',
                    fontSize: 'clamp(1.3rem, 2.5vw, 2rem)',
                  }}
                >
                  {selected.farm_name}
                </span>
              ) : (
                <span
                  style={{
                    color: 'gray',
                    fontSize: 'clamp(1rem, 2vw, 1.5rem)',
                  }}
                >
                  Select an Item
                </span>
              )
            }
            sx={{
              padding: 0,
              fontSize: '1rem',
              '& .MuiOutlinedInput-notchedOutline': {
                border: 'none',
              },
              '& .MuiSelect-select': {
                textAlign: 'left',
                paddingLeft: 0.5,
                paddingY: { xs: 0, sm:1, md: 2 },
              },
            }}
          >
            {options.map((option) => (
              <MenuItem
                key={option._id}
                value={option}
                sx={{
                  textAlign: 'left',
                  fontWeight: 'normal',
                  fontSize: 'clamp(1rem, 1.5vw, 1.2rem)', 
                }}
              >
                {option.farm_name}
              </MenuItem>
            ))}
            <MenuItem
              value="add-new"
              sx={{ textAlign: 'left', fontSize: 'clamp(1rem, 1.5vw, 1.2rem)' }}
            >
              <em>Add New</em>
            </MenuItem>
          </Select>
        </FormControl>

        <Dialog open={openDialog} onClose={handleCloseDialog}>
          <Box
            sx={{
              padding: {
                xs: '20px 30px',
                sm: '30px 55px',
                md: '30px 60px',
                lg: '45px 60px',
                xl: '60px 90px ',
              },
            }}
          >
            <DialogTitle
              sx={{
                fontWeight: 'bold',
                fontSize: '30px',
                marginBottom: '12px',
                padding: 0,
                textAlign: 'start',
                color: '#333',
              }}
            >
              <Typography variant="h5" fontWeight={600} color="black">
                Add Farm
              </Typography>
            </DialogTitle>
            <Grid2 container spacing={0} sx={{ padding: 0 }}>
              <DialogContent sx={{ padding: 0 }}>
                <Box
                  sx={{
                    color: '#666',
                    marginBottom: '24px',
                    textAlign: 'start',
                  }}
                >
                  <Typography variant="body1" color="#666" gutterBottom>
                    Fill up the form to add a pig farm.
                  </Typography>
                </Box>
                <Grid2 size={12}>
                  <Box
                    sx={{
                      width: '99%',
                      paddingBottom: '15px',
                    }}
                  >
                    <TextField
                      placeholder="Farm Name"
                      variant="outlined"
                      fullWidth
                      value={newItem}
                      onChange={(e) => setNewItem(e.target.value)} // Update new item input
                      InputProps={{
                        startAdornment: (
                          <InputAdornment position="start">
                            <Box
                              sx={{
                                color: '#222222',
                                fontSize: 'clamp(18px, 2vw, 24px)',
                              }}
                            >
                              <DirectionsBikeIcon />
                            </Box>
                          </InputAdornment>
                        ),
                        sx: {
                          fontSize: 'clamp(14px, 1.5vw, 18px)',
                          '& input': {
                            padding: { xs: 1, sm: 1.2, md: 1.9, lg: 2.2 },
                          },
                        },
                      }}
                      sx={{
                        height: '100%',
                        border: '1px solid black',
                        borderRadius: '5px',
                        '& .MuiOutlinedInput-notchedOutline': {
                          border: 'none',
                        },
                        '&:hover .MuiOutlinedInput-notchedOutline': {
                          border: '2px solid #11703b',
                        },
                        '&.Mui-focused .MuiOutlinedInput-notchedOutline': {
                          border: '2px solid #11703b',
                        },
                      }}
                    />
                  </Box>
                  <Box
                    sx={{
                      width: '99%',
                    }}
                  >
                    <TextField
                      placeholder="Address"
                      variant="outlined"
                      fullWidth
                      InputProps={{
                        startAdornment: (
                          <InputAdornment position="start">
                            <Box
                              sx={{
                                color: '#222222',
                                fontSize: 'clamp(18px, 2vw, 24px)',
                              }}
                            >
                              <DirectionsBikeIcon />
                            </Box>
                          </InputAdornment>
                        ),
                        sx: {
                          fontSize: 'clamp(14px, 1.5vw, 18px)',
                          '& input': {
                            padding: { xs: 1, sm: 1.2, md: 1.9, lg: 2.2 },
                          },
                        },
                      }}
                      sx={{
                        height: '100%',
                        border: '1px solid black',
                        borderRadius: '5px',
                        '& .MuiOutlinedInput-notchedOutline': {
                          border: 'none',
                        },
                        '&:hover .MuiOutlinedInput-notchedOutline': {
                          border: '2px solid #11703b',
                        },
                        '&.Mui-focused .MuiOutlinedInput-notchedOutline': {
                          border: '2px solid #11703b',
                        },
                      }}
                    />
                  </Box>
                </Grid2>
              </DialogContent>
              <Grid2 size={12}>
                <DialogActions>
                  <Box
                    sx={{
                      display: 'flex',
                      marginTop: '15px',
                      justifyContent: 'flex-end',
                    }}
                  >
                    <Button
                      onClick={handleCloseDialog}
                      sx={{
                        color: '#222222',
                        textTransform: 'none',
                        fontSize: '16px',
                        marginRight: '20px',
                      }}
                    >
                      <Typography
                        sx={{
                          fontWeight: 500,
                          fontSize: 'clamp(13px, 1vw + 5px, 16px)',
                        }}
                      >
                        Cancel
                      </Typography>
                    </Button>
                    <Button
                      onClick={handleAddNewItem}
                      sx={{
                        color: 'white',
                        backgroundColor: '#11703b',
                        borderRadius: '10px',
                        fontWeight: 'bold',
                        fontSize: '16px',
                        padding: '10px 20px',
                      }}
                    >
                      <Typography
                        sx={{
                          fontWeight: 500,
                          fontSize: 'clamp(11px, 1vw + 5px, 16px)',
                        }}
                      >
                        Add
                      </Typography>
                    </Button>
                  </Box>
                </DialogActions>
              </Grid2>
            </Grid2>
          </Box>
        </Dialog>
      </Grid2>
    </ThemeProvider>
  )
}

export default DropdownWithAddButton
