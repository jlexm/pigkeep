import { Box, Grid2, Typography } from '@mui/material'
import login from '../../assets/phone_login.svg'
import home from '../../assets/phone_home.svg'
import qr from '../../assets/phone_qr.svg'
import scan from '../../assets/phone_scan.svg'
import info from '../../assets/phone_info.svg'
import web from '../../assets/web_dashboard.svg'
import {
  createTheme,
  responsiveFontSizes,
  ThemeProvider,
} from '@mui/material/styles'

let theme = createTheme()
theme = responsiveFontSizes(theme)

export default function Guide() {
  return (
    <ThemeProvider theme={theme}>
      {' '}
      <Grid2 container size={12} spacing={5}>
        <Grid2 className="pigSales" size={12}>
          <Grid2 container size={10} className="pigSales">
            <Typography variant="h4" color="white" fontWeight={700}>
              How PigKeep Works?
            </Typography>
          </Grid2>
        </Grid2>
        <Grid2 className="guideCard" size={{ xs: 12, md: 6, lg: 4 }}>
          <Grid2 size={12}>
            <Typography
              variant="h3"
              color="#11703b"
              fontWeight={700}
              gutterBottom
            >
              1
            </Typography>
          </Grid2>
          <Grid2 size={12} className="numberGuide">
            <Typography variant="subtitle1" color="black" gutterBottom>
              Register using the mobile app.
            </Typography>
          </Grid2>
          <Grid2>
            <Box
              component="img"
              src={login}
              alt="login"
              className="responsiveImage"
              sx={{ width: 280 }}
            />
          </Grid2>
        </Grid2>
        <Grid2 className="guideCard" size={{ xs: 12, md: 6, lg: 4 }}>
          <Grid2 size={12}>
            <Typography
              variant="h3"
              color="#11703b"
              fontWeight={700}
              gutterBottom
            >
              2
            </Typography>
          </Grid2>
          <Grid2 size={12}>
            <Typography variant="subtitle1" color="black" gutterBottom>
              Create a pig farm. Manage and update pigs.
            </Typography>
          </Grid2>
          <Grid2>
            <Box
              component="img"
              src={home}
              alt="home"
              className="responsiveImage"
              sx={{ width: 280 }}
            />
          </Grid2>
        </Grid2>
        <Grid2 className="guideCard" size={{ xs: 12, md: 6, lg: 4 }}>
          <Grid2 size={12}>
            <Typography
              variant="h3"
              color="#11703b"
              fontWeight={700}
              gutterBottom
            >
              3
            </Typography>
          </Grid2>
          <Grid2 size={12} className="numberGuide">
            <Typography variant="subtitle1" color="black" gutterBottom>
              Print QR codes and attach to pig ear tag.
            </Typography>
          </Grid2>
          <Grid2>
            <Box
              component="img"
              src={qr}
              alt="qr"
              className="responsiveImage"
              sx={{ width: 280 }}
            />
          </Grid2>
        </Grid2>
        <Grid2 className="guideCard" size={{ xs: 12, md: 6, lg: 4 }}>
          <Grid2 size={12}>
            <Typography
              variant="h3"
              color="#11703b"
              fontWeight={700}
              gutterBottom
            >
              4
            </Typography>
          </Grid2>
          <Grid2 size={12} className="numberGuide">
            <Typography variant="subtitle1" color="black" gutterBottom>
              Scan QR codes.
            </Typography>
          </Grid2>
          <Grid2>
            <Box
              component="img"
              src={scan}
              alt="scan"
              className="responsiveImage"
              sx={{ width: 280 }}
            />
          </Grid2>
        </Grid2>
        <Grid2 className="guideCard" size={{ xs: 12, md: 6, lg: 4 }}>
          <Grid2 size={12}>
            <Typography
              variant="h3"
              color="#11703b"
              fontWeight={700}
              gutterBottom
            >
              5
            </Typography>
          </Grid2>
          <Grid2 size={12} className="numberGuide">
            <Typography variant="subtitle1" color="black" gutterBottom>
              View pig information.
            </Typography>
          </Grid2>
          <Grid2>
            <Box
              component="img"
              src={info}
              alt="info"
              className="responsiveImage"
              sx={{ width: 280 }}
            />
          </Grid2>
        </Grid2>
        <Grid2 className="guideCard" size={{ xs: 12, md: 6, lg: 4 }}>
          <Grid2 size={12}>
            <Typography
              variant="h3"
              color="#11703b"
              fontWeight={700}
              gutterBottom
            >
              6
            </Typography>
          </Grid2>
          <Grid2 size={12} className="numberGuide">
            <Typography variant="subtitle1" color="black" gutterBottom>
              Use web app to analyze reports.{' '}
            </Typography>
          </Grid2>
          <Grid2>
            <Box
              component="img"
              src={web}
              alt="web"
              className="responsiveImage"
              sx={{ width: 400, paddingTop: 20 }}
            />
          </Grid2>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  )
}
