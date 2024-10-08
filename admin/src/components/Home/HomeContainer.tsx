import Box from '@mui/material/Box'
import './HomeScreen.css'
import hugepig from '../../assets/hugepig.svg'
import { Grid2, Stack, ThemeProvider, Typography } from '@mui/material'
import theme from '../../Theme'

export default function SimpleContainer() {
  return (
    <ThemeProvider theme={theme}>
      <Grid2 container size={12} className="homeContainer">
        <Grid2 container spacing={3} size={{ xs: 12, lg: 6 }} alignContent={'space-evenly'}>
          <Grid2  size={12}>
            <Stack
              spacing={2}
              direction={{ xs: 'column', md: 'row' }}
              useFlexGap
              sx={{ flexWrap: 'wrap' }}
            >
              <Typography
                fontWeight={700}
                color="white"
                sx={{
                  fontSize: 'clamp(7rem, 11vw, 13rem)', 
                  lineHeight: 0.8, 
                  margin: 0, 
                  padding: 0, 
                }}
              >
                42
              </Typography>

              <Typography
                variant="h3"
                fontWeight={700}
                color="white "
                alignSelf={{ xs: 'center', md: 'flex-end' }}
              >
                Total Pigs
              </Typography>
            </Stack>
          </Grid2>

          <Grid2 size={{ lg: 12, xl: 11 }}>
            <Typography
              variant='subtitle1'
              color="white"
              fontWeight={100}
              textAlign={{ xs: 'center', md: 'start' }}
            >
              PigKeep web provides a platform for pig farm owners to efficiently
              manage and analyze their pig farm records. Any updates made on the
              PigKeep mobile app will be integrated into the records on the web
              platform.
            </Typography>
          </Grid2>
        </Grid2>

        <Grid2 container size={{ xs: 12, lg: 6 }}>
          <Box className="hugePig">
            <Box
              component="img"
              src={hugepig}
              alt="Huge Pig"
              className="responsiveImage"
              sx={{ width: { xs: 0, lg: 560, xl: 650 } }}
            />
          </Box>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  )
}
