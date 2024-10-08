import React, { ReactNode } from 'react'
import {
  Button,
  Dialog,
  DialogContent,
  DialogTitle,
  Box,
  Grid2,
  TextField,
  InputAdornment,
  ThemeProvider,
  Typography,
} from '@mui/material' // Import necessary components
import theme from '../Theme'

interface ReusableDialogBoxProps {
  title: string // Title must be a string
  description: string // Description must be a string
  formFields: { placeholder: string; icon: ReactNode }[] // Array of objects with placeholders and icons
  onSave: () => void // Callback function for saving
  onCancel: () => void // Callback function for canceling/closing the dialog
  saveButtonText?: string // Optional text for the save button (default: "Save")
  saveButtonColor?: string // Optional color for the save button (default: green)
}

const ReusableDialogBox: React.FC<ReusableDialogBoxProps> = ({
  title,
  description,
  formFields,
  onSave,
  onCancel, // Include onCancel prop
  saveButtonText = 'Save', // Default value if not provided
  saveButtonColor = '#11703b', // Default button color
}) => {
  return (
    <ThemeProvider theme={theme}>
      <Dialog open>
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
              {title}
            </Typography>
          </DialogTitle>
          <DialogContent sx={{ padding: 0 }}>
            <Grid2 container spacing={0} sx={{ padding: 0 }}>
              <Grid2 size={12}>
                <Box
                  sx={{
                    color: '#666',
                    marginBottom: '24px',
                    textAlign: 'start',
                  }}
                >
                  <Typography variant="body1">{description}</Typography>
                </Box>
              </Grid2>
              {formFields.map((field, index) => (
                <Grid2 size={12} key={index}>
                  <Box
                    sx={{
                      width: '99%',
                      height: 'clamp(35px, 5vw, 60px)',
                      paddingBottom: '15px',
                    }}
                  >
                    <TextField
                      placeholder={field.placeholder}
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
                              {field.icon}
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
              ))}
              <Grid2 size={12}>
                {' '}
                {/* Full width for the buttons */}
                <Box
                  sx={{
                    display: 'flex',
                    marginTop: '15px', // Added margin for better spacing
                    justifyContent: 'flex-end',
                  }}
                >
                  <Button
                    onClick={onCancel} // Trigger cancel function
                    sx={{
                      color: '#222222', // Cancel button color
                      textTransform: 'none', // Disable uppercase transformation
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
                    onClick={onSave}
                    sx={{
                      color: 'white',
                      backgroundColor: saveButtonColor,
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
                      {saveButtonText}
                    </Typography>
                  </Button>
                </Box>
              </Grid2>
            </Grid2>
          </DialogContent>
        </Box>
      </Dialog>
    </ThemeProvider>
  )
}

export default ReusableDialogBox
