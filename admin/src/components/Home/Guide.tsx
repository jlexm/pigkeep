import { Box, Grid2 } from '@mui/material'
import login from '../../assets/phone_login.svg'
import home from '../../assets/phone_home.svg'
import qr from '../../assets/phone_qr.svg'
import scan from '../../assets/phone_scan.svg'
import info from '../../assets/phone_info.svg'
import web from '../../assets/web_dashboard.svg'

export default function Guide() {
  return (
    <Grid2 container size={12} spacing={5}>
      <Grid2 className="pigSales" size={12}>
        <Grid2 container size={10} className="pigSales">
          <p className="pigSalesTitle">How PigKeep Works?</p>
        </Grid2>
      </Grid2>
      <Grid2 className="guideCard" size={{xs:12, md: 6, lg:4}}>
        <Grid2 size={12} className="number">
          <h1>1</h1>
        </Grid2>
        <Grid2 size={12} className="numberGuide">
          <p>Register using the mobile app.</p>
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
      <Grid2 className="guideCard" size={{xs:12, md: 6, lg:4}}>
        <Grid2 size={12} className="number">
          <h1>2</h1>
        </Grid2>
        <Grid2 size={12} className="numberGuide">
          <p>Create a pig farm. Manage and update pigs.</p>
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
      <Grid2 className="guideCard" size={{xs:12, md: 6, lg:4}}>
        <Grid2 size={12} className="number">
          <h1>3</h1>
        </Grid2>
        <Grid2 size={12} className="numberGuide">
          <p>Print QR codes and attach to pig ear tag.</p>
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
      <Grid2 className="guideCard" size={{xs:12, md: 6, lg:4}}>
        <Grid2 size={12} className="number">
          <h1>4</h1>
        </Grid2>
        <Grid2 size={12} className="numberGuide">
          <p>Scan QR codes.</p>
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
      <Grid2 className="guideCard" size={{xs:12, md: 6, lg:4}}>
        <Grid2 size={12} className="number">
          <h1>5</h1>
        </Grid2>
        <Grid2 size={12} className="numberGuide">
          <p>View pig information.</p>
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
      <Grid2 className="guideCard" size={{xs:12, md: 6, lg:4}}>
        <Grid2 size={12} className="number">
          <h1>6</h1>
        </Grid2>
        <Grid2 size={12} className="numberGuide">
          <p>Use web app to analyze reports. </p>
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
  )
}
