import * as React from 'react'
import { PieChart } from '@mui/x-charts/PieChart'
import { Grid2 } from '@mui/material'
import './HomeScreen.css'

export default function BasicPie() {
  return (
    (<Grid2 container spacing={1}>
      <Grid2 size={12}>
        <h1 className="pigCount">Pig Count</h1>
      </Grid2>
      <Grid2 size={12}>
        <p className="parag">
          As of <span style={{ color: 'green' }}>July 1, 2024</span>, the
          largest portion of pigs on your farm are weaners, with mature pigs
          being the least numerous.
        </p>
      </Grid2>
      <Grid2 size={12}>
        <PieChart
          series={[
            {
              data: [
                {
                  id: 1,
                  value: 15,
                  label: '15 series B'
                },
                {
                  id: 0,
                  value: 10,
                  label: '10 series A'
                },
                { id: 2, value: 20, label: '20 series C' },
                { id: 3, value: 20, label: '20 series D' },
              ],
            },
          ]}
          width={620}
          height={400}
        />
      </Grid2>
    </Grid2>)
  );
}
