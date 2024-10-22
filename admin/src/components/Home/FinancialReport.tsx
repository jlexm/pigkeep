import * as React from 'react'
import { BarChart } from '@mui/x-charts/BarChart'
import { Grid2, ThemeProvider, Typography } from '@mui/material'
import MonthPagination from './PaginationControl'
import theme from '../../Theme'

// format peso sign
const formatCurrency = (amount: number) => {
  return `₱${amount.toLocaleString()}`
}

export default function BarGraph() {
  return (
   <ThemeProvider theme={theme}>
     <Grid2 container spacing={6} sx={{paddingX:5}}>
      <Grid2 size={12}>
        <Typography variant='h2' fontWeight={700} color='black'>Financial Reports</Typography>
      </Grid2>
      <Grid2 size={12}>
        <MonthPagination />
      </Grid2>

      {/* Pig Sales Section */}

      <Grid2 container size={{ xs: 12, lg: 5 }} className="boxCenter">
        <Grid2 container size={{ xs: 9.5, }} className="pigSalesBox">
          <Grid2 container size={12} className="pigSalesOne">
            <Typography variant='h5' color='white' paddingX={2}>Pig Sales</Typography>
          </Grid2>
          <Grid2 size={12}>
            <Typography variant='h3' fontWeight={700} className="totalPigSales" >{formatCurrency(200000)}</Typography>
          </Grid2>
        </Grid2>
      </Grid2>
      <Grid2 size={{ xs: 12, lg: 7 }}>
        <BarChart
          xAxis={[
            {
              scaleType: 'band',
              data: [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
                'Jul',
                'Aug',
                'Sep',
                'Oct',
                'Nov',
                'Dec',
              ],
              label: '2024',
              labelStyle: {
                fontSize: '20px',
                fontWeight: 500,
                fill: 'black',
              },
            },
          ]}
          series={[{ data: [200000, 300000], color: '#554F91' }]}
          height={340}
          sx={{
            '& .MuiChartsAxis-y': {
              marginRight: '10px',
            },
            
          }}
          margin={{ left: 60 }}
        />
      </Grid2>

      {/* Feed Expense Section */}

      <Grid2 container size={{ xs: 12, lg: 5 }} className="boxCenter">
        <Grid2 container size={{ xs: 9.5, }} className="pigSalesBox">
          <Grid2 container size={12} className="pigSales">
            <Typography variant='h5' color='white' paddingX={2}>Total Feed Expense </Typography>
          </Grid2>
          <Grid2 size={12} alignContent={'center'}>
            <Typography variant='h3' fontWeight={700} className="totalSales">{formatCurrency(200000)}</Typography>
          </Grid2>
        </Grid2>
      </Grid2>
      <Grid2 size={{ xs: 12, lg: 7 }}>
        <BarChart
          xAxis={[
            {
              scaleType: 'band',
              data: [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
                'Jul',
                'Aug',
                'Sep',
                'Oct',
                'Nov',
                'Dec',
              ],
              label: '2024',
              labelStyle: {
                fontSize: '20px',
                fontWeight: 500,
                fill: 'black',
              },
            },
          ]}
          series={[{ data: [200000, 300000], color: '#11703b' }]}
          height={340}
          sx={{
            '& .MuiChartsAxis-y': {
              marginRight: '10px',
            },
            
           
          }}
          margin={{ left: 60 }}
        />
      </Grid2>

      {/* Medicine Expense Section */}

      <Grid2 container size={{ xs: 12, lg: 5 }} className="boxCenter">
        <Grid2 container size={{ xs: 9.9, }} minWidth={30} className="pigSalesBox">
          <Grid2 container size={12} className="pigSales1">
            <Typography variant='h5' color='white' paddingX={2}>Total Medicine Expense </Typography>
          </Grid2>
          <Grid2 size={12}>
            <Typography variant='h3' fontWeight={700} className="meds">{formatCurrency(200000)}</Typography>
          </Grid2>
        </Grid2>
      </Grid2>
      <Grid2 size={{ xs: 12, lg: 7 }}>
        <BarChart
          xAxis={[
            {
              scaleType: 'band',
              data: [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
                'Jul',
                'Aug',
                'Sep',
                'Oct',
                'Nov',
                'Dec',
              ],
              label: '2024',
              labelStyle: {
                fontSize: '20px',
                fontWeight: 500,
                fill: 'black',
              },
            },
          ]}
          series={[{ data: [200000, 300000], color: '#3B4DE1' }]}

          height={340}
          sx={{
            '& .MuiChartsAxis-y': {
              marginRight: '10px',
            },
            
          }}
          margin={{ left: 60 }}
        />
      </Grid2>
    </Grid2>
   </ThemeProvider>
  )
}
