import { createTheme } from '@mui/material/styles';

const theme = createTheme({
  typography: {
    h3: {
      fontSize: 'clamp(2.3rem, 2.8vw, 3.3rem)', // Fluid typography for h3
    },
    subtitle1: {
      fontSize: 'clamp(0.9rem, 1.2vw, 1.2rem)', // Fluid typography for subtitle1
    },
  },
});

export default theme;
