import * as React from 'react'
import CssBaseline from '@mui/material/CssBaseline'
import Box from '@mui/material/Box'
import Container from '@mui/material/Container'
import './Home.css'
import hugepig from '../assets/img/hugepig.svg'

export default function SimpleContainer() {
  return (
    <React.Fragment>
      <CssBaseline />
      <Container className="homeContainer">
        {/* First Box with two rows */}
        <Box className="twoRows">
          <Box className="row">Row 1: Top</Box>
          <Box className="row">Row 2: Bottom</Box>
        </Box>
        
        {/* Second Box with image */}
        <Box className="hugePig">
          <Box
            component="img"
            src={hugepig}
            alt="Huge Pig"
            className="responsiveImage"
          />
        </Box>
      </Container>
    </React.Fragment>
  )
}
