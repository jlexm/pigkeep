import { createTheme } from '@mui/material/styles';

const theme = createTheme({
  typography: {
    fontFamily: 'Poppins, sans-serif', 
    h1: {
      fontSize: 'clamp(2rem, 5vw, 3.125rem)', 
    },
    h2: {
      fontSize: 'clamp(2.8rem, 5vw, 3.75rem)', 
    },
    h3: {
      fontSize: 'clamp(2.5rem, 5vw, 4rem)', 
    },
    h4: {
      fontSize: 'clamp(1.5rem, 2vw, 1.875rem)', 
    },
    h5: {
      
      fontSize: 'clamp(1.7rem, 2vw, 3.75rem)', 
    },
    h6: {
      fontSize: 'clamp(1rem, 2.5vw, 1.438rem)', 
    },
    body1: {
      fontWeight: 200,
      fontSize: 'clamp(0.95rem, 2vw, 1rem)',
    },
    body2: {
      fontWeight: 200,
      fontSize: 'clamp(0.75rem, 2.5vw, 0.875rem)', 
    },
    subtitle1: {
      fontSize: 'clamp(1rem, 2vw, 1.125rem)', 
    },
    subtitle2: {
      fontSize: 'clamp(0.8rem, 1vw, 1.125rem)', 
    },
  },
});

export default theme;
