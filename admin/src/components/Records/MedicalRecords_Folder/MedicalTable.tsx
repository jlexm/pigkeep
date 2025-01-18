import * as React from 'react';
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
} from '@mui/material';

interface MedicalData {
  medicineName: string;
  dosage: string;
  quantity: number;
  consume: number;
}

const MedicalTable: React.FC<React.PropsWithChildren<{ data: MedicalData[] }>> = ({
  data,
}) => {

  return (
    <>
      <TableContainer>
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
            </TableRow>
          </TableHead>
          <TableBody>
            {data.map((row) => (
              <TableRow key={row.medicineName}>
                <TableCell sx={{
                  paddingLeft: 0,
                  textAlign: 'start',
                  width: 90,
                }}>{row.medicineName}</TableCell>
                <TableCell sx={{
                  color: '#3B4DE1',
                  paddingRight: 0,
                  textAlign: 'end',
                  width: 90,
                }}>{row.quantity} x {row.dosage}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </>
  );
};

const App = ({ medicine }: { medicine: any[]}) => {
  return <MedicalTable data={medicine} />;
}

export default App;
