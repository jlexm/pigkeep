import React, { ReactNode, useState } from 'react';
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
  CircularProgress,
  IconButton,
} from '@mui/material';
import theme from '../Theme';
import { Visibility, VisibilityOff } from '@mui/icons-material';

interface ReusableDialogBoxProps {
  title: string;
  description: string;
  formFields: {
    placeholder: string;
    type: string;
    icon: ReactNode;
    value: any;
    slotProps?: any;
    disabled?: boolean;
    onChange: (v: any) => void;
  }[];
  onSave: () => void; // function for saving
  onCancel: () => void; // function for canceling/closing dialog
  saveButtonText?: string; // changeable text for save button
  saveButtonColor?: string; // changeable color for save button
  loading?: boolean;
}

const ReusableDialogBox: React.FC<ReusableDialogBoxProps> = ({
  title,
  description,
  formFields,
  onSave,
  onCancel,
  saveButtonText = 'Save', // default value
  saveButtonColor = '#11703b', // default button color
  loading,
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
              {formFields.map((field, index) => {
                const [valueObscure, setValueObscure] = useState(true);
                return (
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
                        disabled={field.disabled}
                        slotProps={field.slotProps}
                        variant="outlined"
                        fullWidth
                        type={
                          field.type
                            ? field.type === 'password'
                              ? valueObscure
                                ? 'password'
                                : 'text'
                              : field.type
                            : 'text'
                        }
                        value={field.value}
                        onChange={(v) => field.onChange(v.target.value)}
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
                          endAdornment:
                            field.type === 'password' ? (
                              <InputAdornment position="end">
                                <Box
                                  sx={{
                                    color: '#222222',
                                    fontSize: 'clamp(18px, 2vw, 24px)',
                                  }}
                                >
                                  <IconButton
                                    tabIndex={-1}
                                    aria-label="visibility"
                                    onClick={() => {
                                      setValueObscure((prev) => !prev);
                                    }}
                                  >
                                    {valueObscure ? (
                                      <Visibility />
                                    ) : (
                                      <VisibilityOff />
                                    )}
                                  </IconButton>
                                </Box>
                              </InputAdornment>
                            ) : undefined,
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
                );
              })}
              <Grid2 size={12}>
                <Box
                  sx={{
                    display: 'flex',
                    marginTop: '15px',
                    justifyContent: 'flex-end',
                  }}
                >
                  <Button
                    onClick={onCancel}
                    disabled={loading}
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
                    disabled={loading}
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
                    {loading && (
                      <CircularProgress
                        size={20}
                        sx={{ color: 'white', mr: 2 }}
                      />
                    )}
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
  );
};

export default ReusableDialogBox;
