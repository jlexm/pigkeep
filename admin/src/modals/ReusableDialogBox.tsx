import React, { ReactNode } from 'react';
import {
  Button,
  Dialog,
  DialogContent,
  DialogTitle,
  Box,
  Grid2,
  TextField,
  InputAdornment,
} from '@mui/material'; // Import necessary components

interface ReusableDialogBoxProps {
  title: string; // Title must be a string
  description: string; // Description must be a string
  formFields: { placeholder: string; icon: ReactNode }[]; // Array of objects with placeholders and icons
  onSave: () => void; // Callback function for saving
  onCancel: () => void; // Callback function for canceling/closing the dialog
  saveButtonText?: string; // Optional text for the save button (default: "Save")
  saveButtonColor?: string; // Optional color for the save button (default: green)
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
    <Dialog open>
      <Box sx={{ padding: '70px 100px ' }}> {/* Adjust width as needed */}
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
          {title}
        </DialogTitle>
        <DialogContent sx={{ padding: 0 }}> {/* Removed padding */}
          <Grid2 container spacing={0} sx={{ padding: 0 }}> {/* Use Grid2 for layout */}
            <Grid2 size={12}> {/* Full width for the description */}
              <Box
                sx={{
                  fontSize: '16px',
                  color: '#666',
                  marginBottom: '24px',
                  textAlign: 'start',
                }}
              >
                {description}
              </Box>
            </Grid2>
            {formFields.map((field, index) => (
              <Grid2 size={12} key={index}> {/* Full width for each form field */}
                <Box sx={{ width: '99%', height: '55px', paddingBottom: '15px' }}>
                  <TextField
                    placeholder={field.placeholder}
                    variant="outlined"
                    fullWidth
                    InputProps={{
                      startAdornment: (
                        <InputAdornment position="start">
                          <Box sx={{ color: '#222222' }}>{field.icon}</Box> {/* Change icon color to black */}
                        </InputAdornment>
                      ),
                      // Add placeholder styling
                      sx: {
                        '&::placeholder': {
                          color: '#222222', // Set the desired darker placeholder color here
                        },
                      },
                    }}
                    sx={{
                      height: '100%', // Ensure the TextField takes full height
                      border: '1px solid black', // Set border weight and color
                      borderRadius: '5px', // Optional: add border radius
                      '& .MuiOutlinedInput-notchedOutline': {
                        border: 'none', // Remove default outline
                      },
                      '&:hover .MuiOutlinedInput-notchedOutline': {
                        border: '2px solid #11703b', // Change border on hover
                      },
                      '&.Mui-focused .MuiOutlinedInput-notchedOutline': {
                        border: '2px solid #11703b', // Change border on focus
                      },
                    }}
                  />
                </Box>
              </Grid2>
            ))}
            <Grid2 size={12}> {/* Full width for the buttons */}
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
                  Cancel
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
                  {saveButtonText}
                </Button>
              </Box>
            </Grid2>
          </Grid2>
        </DialogContent>
      </Box>
    </Dialog>
  );
};

export default ReusableDialogBox;
