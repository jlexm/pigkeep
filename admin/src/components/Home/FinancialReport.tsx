import * as React from 'react'
import { BarChart } from '@mui/x-charts/BarChart'
import { Grid2, ThemeProvider, Typography } from '@mui/material'
import MonthPagination from './PaginationControl'
import theme from '../../Theme'
import { generateYearlySalesData } from '../../services/utils.service'

type SalesData = {
  totalSales: number
  salesData: number[]
}

const BAR_MONTHS = [
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
]

// format peso sign
const formatCurrency = (amount: number) => {
  return `${amount.toLocaleString('en-PH', { minimumFractionDigits: 2, currency: 'PHP', style: 'currency' })}`
}

export default function FinancialReport({ ledgers, feedHistory, medicineHistory }: { ledgers: any[], feedHistory: any[], medicineHistory: any[] }) {

  const [year, setYear] = React.useState<number>(new Date().getFullYear())
  const [pigSalesData, setPigSalesData] = React.useState<SalesData>({ totalSales: 0, salesData: [] })
  const [feedsCostData, setFeedsCostData] = React.useState<SalesData>({ totalSales: 0, salesData: [] })
  const [medsCostData, setMedsCostData] = React.useState<SalesData>({ totalSales: 0, salesData: [] })


  // calculate financial data 
  React.useEffect(() => {

    // calc pig sales
    const pigSales = generateYearlySalesData(year, ledgers, 'transactionDate', 'priceSold')
    setPigSalesData(
      {
        totalSales: pigSales.reduce((a, b) => a + b, 0),
        salesData: pigSales,
      }
    )

    // calc feeds cost
    const feedsCost = generateYearlySalesData(year, feedHistory.filter((item) => item.status === 'stock' ), 'createdAt', 'cost')
    setFeedsCostData(
      {
        totalSales: feedsCost.reduce((a, b) => a + b, 0),
        salesData: feedsCost,
      }
    )

    // calc meds cost
    const medsCost = generateYearlySalesData(year, medicineHistory, 'createdAt', 'cost')
    setMedsCostData(
      {
        totalSales: medsCost.reduce((a, b) => a + b, 0),
        salesData: medsCost,
      }
    )

  }, [year, ledgers, feedHistory, medicineHistory])


  return (
   <ThemeProvider theme={theme}>
     <Grid2 container spacing={6} sx={{paddingX:5}}>
      <Grid2 size={12}>
        <Typography variant='h2' fontWeight={700} color='black'>Financial Reports</Typography>
      </Grid2>
      <Grid2 size={12}>
        <MonthPagination yearChange={setYear}/>
      </Grid2>

      {/* Pig Sales Section */}

      <Grid2 container size={{ xs: 12, lg: 5 }} className="boxCenter">
        <Grid2 container size={{ xs: 9.5, }} className="pigSalesBox">
          <Grid2 container size={12} className="pigSalesOne">
            <Typography variant='h5' color='white' paddingX={2}>Pig Sales</Typography>
          </Grid2>
          <Grid2 size={12}>
            <Typography variant='h3' fontWeight={700} className="totalPigSales" >{formatCurrency(pigSalesData.totalSales)}</Typography>
          </Grid2>
        </Grid2>
      </Grid2>
      <Grid2 size={{ xs: 12, lg: 7 }}>
        <BarChart
          xAxis={[
            {
              scaleType: 'band',
              data: BAR_MONTHS,
              label: `YEAR ${year}`,
              labelStyle: {
                fontSize: '20px',
                fontWeight: 500,
                fill: 'black',
              },
            },
          ]}
          series={[{ data: pigSalesData.salesData, color: '#554F91', valueFormatter: (v) => (v === null ? '' : formatCurrency(v)) }]}
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
            <Typography variant='h3' fontWeight={700} className="totalSales">{formatCurrency(feedsCostData.totalSales)}</Typography>
          </Grid2>
        </Grid2>
      </Grid2>
      <Grid2 size={{ xs: 12, lg: 7 }}>
        <BarChart
          xAxis={[
            {
              scaleType: 'band',
              data: BAR_MONTHS,
              label: '2024',
              labelStyle: {
                fontSize: '20px',
                fontWeight: 500,
                fill: 'black',
              },
            },
          ]}
          series={[{ data: feedsCostData.salesData, color: '#11703b', valueFormatter: (v) => (v === null ? '' : formatCurrency(v)) }]}
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
            <Typography variant='h3' fontWeight={700} className="meds">{formatCurrency(medsCostData.totalSales)}</Typography>
          </Grid2>
        </Grid2>
      </Grid2>
      <Grid2 size={{ xs: 12, lg: 7 }}>
        <BarChart
          xAxis={[
            {
              scaleType: 'band',
              data: BAR_MONTHS,
              label: '2024',
              labelStyle: {
                fontSize: '20px',
                fontWeight: 500,
                fill: 'black',
              },
            },
          ]}
          series={[{ data: medsCostData.salesData, color: '#3B4DE1', valueFormatter: (v) => (v === null ? '' : formatCurrency(v)) }]}

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
