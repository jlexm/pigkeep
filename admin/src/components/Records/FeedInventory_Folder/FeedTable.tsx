import * as React from 'react'
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  IconButton,
} from '@mui/material'
import IndeterminateCheckBoxIcon from '@mui/icons-material/IndeterminateCheckBox'

interface FeedData {
  type: string
  stock: string
  consume: number
}

const MedsTable: React.FC<React.PropsWithChildren<{ data: FeedData[] }>> = ({
  data,
}) => {
  return (
    <TableContainer>
      <Table>
        <TableHead>
          <TableRow>
            <TableCell
              sx={{ color: '#11703b', paddingLeft: 0, textAlign: 'start' }}
            >
              Feed Type
            </TableCell>
            <TableCell
              sx={{
                color: '#11703b',
                paddingRight: 0,
                textAlign: 'end',
                width: 140,
              }}
            >
              Stock
            </TableCell>
            <TableCell
              sx={{
                color: '#11703b',
                paddingRight: 0,
                textAlign: 'end',
                width: 30,
              }}
            >
              Consume
            </TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {data.map((row) => (
            <TableRow key={row.type}>
              <TableCell sx={{
                paddingLeft: 0,
                textAlign: 'start',
                width: 90,
              }}>{row.type}</TableCell>
              <TableCell sx={{
                color: '#11703b', 
                paddingRight: 0,
                textAlign: 'end',
                width: 90,
              }}>{row.stock}</TableCell>
              <TableCell sx={{
                paddingRight: 0,
                textAlign: 'end',
                width: 90,
              }}>
                <IconButton aria-label="delete" color='error'>
                  <IndeterminateCheckBoxIcon />
                </IconButton>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  )
}

// Sample data
const sampleData: FeedData[] = [
  { type: 'Corn', stock: '100 kg', consume: 10 },
  { type: 'Soybean', stock: '200 kg', consume: 35 },
  { type: 'Barley', stock: '150 kg', consume: 50 },
  { type: 'Wheat', stock: '120 kg', consume: 10 },
]

const App = () => {
  return <MedsTable data={sampleData} />
}

export default App
