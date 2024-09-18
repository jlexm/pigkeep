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

const FeedTable: React.FC<React.PropsWithChildren<{ data: FeedData[] }>> = ({
  data,
}) => {
  return (
    <TableContainer >
      <Table>
        <TableHead>
          <TableRow>
            <TableCell
              sx={{ color: '#3B4DE1', paddingLeft: 0, textAlign: 'start' }}
            >
              Medicine Name
            </TableCell>
            <TableCell
              sx={{
                color: '#3B4DE1',
                paddingRight: 0,
                textAlign: 'end',
                width: 140,
              }}
            >
              Stock
            </TableCell>
            <TableCell
              sx={{
                color: '#3B4DE1',
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
                color: '#3B4DE1', 
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
  { type: 'Monessen', stock: '100 mg', consume: 10 },
  { type: 'Biogesic', stock: '200 mg', consume: 35 },
  { type: 'Neozep', stock: '150 mg', consume: 50 },
  { type: 'Katol', stock: '120 mg', consume: 10 },
]

const App = () => {
  return <FeedTable data={sampleData} />
}

export default App
