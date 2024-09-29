import Box from '@mui/material/Box'
import './Home.css'
import hugepig from '../../assets/hugepig.svg'
import { Grid2, Stack } from '@mui/material'

export default function SimpleContainer() {
  return (
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
            <h1 className="totalPigs">Total Pigs</h1>
          </Stack>
        </Grid2>

        <Grid2 size={{lg:12,xl:11}}>
          <p className="descrip">
            PigKeep web provides a platform for pig farm owners to efficiently
            manage and analyze their pig farm records. Any updates made on the
            PigKeep mobile app will be integrated into the records on the web
            platform.
          </p>
        </Grid2>
      </Grid2>

      <Grid2 container size={{xs:12,lg:6}}>
        <Box className="hugePig">
          <Box
            component="img"
            src={hugepig}
            alt="Huge Pig"
            className="responsiveImage"
            sx={{ width: { xs:0,lg:600, xl: 700 } }}
          />
        </Box>
      </Grid2>
    </Grid2>
  )
}
