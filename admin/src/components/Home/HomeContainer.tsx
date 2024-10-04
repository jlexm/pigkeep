import Box from '@mui/material/Box'
import './Home.css'
import hugepig from '../../assets/hugepig.svg'
import { Grid2, Stack, Typography } from '@mui/material'
import {
  createTheme,
  responsiveFontSizes,
  ThemeProvider,
} from '@mui/material/styles'

let theme = createTheme()
theme = responsiveFontSizes(theme)

export default function SimpleContainer() {
  return (
    <ThemeProvider  theme={theme}>
       <Grid2 container size={12} className="homeContainer">
      <Grid2 container size={{xs:12,lg:6}} className="col1">
        <Grid2 size={12}>
          <Stack
            spacing={3}
            direction="row"
            useFlexGap
            sx={{ flexWrap: 'wrap' }}
          >
            
            <h1 className="pigNumber">42</h1>
            <Typography variant='h3' fontWeight='700' color='white 'className="totalPigs">Total Pigs</Typography>
          </Stack>
        </Grid2>

        <Grid2 size={{lg:12,xl:11}}>
          <Typography variant='h6' color='white' fontWeight={300} textAlign={"start"}>
            PigKeep web provides a platform for pig farm owners to efficiently
            manage and analyze their pig farm records. Any updates made on the
            PigKeep mobile app will be integrated into the records on the web
            platform.
          </Typography>
        </Grid2>
      </Grid2>

      <Grid2 container size={{xs:12,lg:6}}>
        <Box className="hugePig">
          <Box
            component="img"
            src={hugepig}
            alt="Huge Pig"
            className="responsiveImage"
            sx={{ width: { xs:0,lg:560, xl: 650 } }}
          />
        </Box>
      </Grid2>
    </Grid2>
    </ThemeProvider>
   
  )
}
