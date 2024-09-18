import * as React from 'react'
import { BarChart } from '@mui/x-charts/BarChart'
import { Grid2 } from '@mui/material'
import MonthPagination from './PaginationControl'

// format peso sign
const formatCurrency = (amount: number) => {
  return `₱${amount.toLocaleString()}`
}

export default function BarGraph() {
  return (
    <Grid2 container spacing={3}>
      <Grid2 size={12}>
        <h1 className="finHead">Financial Report</h1>
      </Grid2>
      <Grid2 size={12}>
        <MonthPagination/>
      </Grid2>

      {/* Pig Sales Section */}

      <Grid2 container size={6} className="pigSalesBox">
        <Grid2 container size={6} className="pigSales">
          <p className="pigSalesTitle">Pig Sales</p>
        </Grid2>
        <Grid2 size={10}>
          <p className="totalSales">{formatCurrency(200000)}</p>
        </Grid2>
      </Grid2>
      <Grid2 size={6}>
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
          width={700}
          height={500}
          sx={{
            '& .MuiChartsAxis-y': {
              marginRight: '10px',
            },
            paddingLeft: '10px',
          }}
          margin={{ left: 60 }}
        />
      </Grid2>

      {/* Feed Expense Section */}

      <Grid2 container size={6} className="pigSalesBox">
        <Grid2 container size={6} className="pigSales">
          <p className="pigSalesTitle">Total Feed Expense </p>
        </Grid2>
        <Grid2 size={10}>
          <p className="totalSales">{formatCurrency(200000)}</p>
        </Grid2>
      </Grid2>
      <Grid2 size={6}>
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
          width={700}
          height={500}
          sx={{
            '& .MuiChartsAxis-y': {
              marginRight: '10px',
            },
            paddingLeft: '10px',
          }}
          margin={{ left: 60 }}
        />
      </Grid2>

      {/* Medicine Expense Section */}

      <Grid2 container size={6} className="pigSalesBox">
        <Grid2 container size={6} className="pigSales1">
          <p className="pigSalesTitle">Total Medicine Expense </p>
        </Grid2>
        <Grid2 size={10}>
          <p className="meds">{formatCurrency(200000)}</p>
        </Grid2>
      </Grid2>
      <Grid2 size={6}>
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
          width={700}
          height={500}
          sx={{
            '& .MuiChartsAxis-y': {
              marginRight: '10px',
            },
            paddingLeft: '10px',
          }}
          margin={{ left: 60 }}
        />
      </Grid2>

    </Grid2>
  )
}
