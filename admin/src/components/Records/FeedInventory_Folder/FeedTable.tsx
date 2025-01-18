import * as React from 'react';
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
} from '@mui/material';
import { ThemeProvider } from '@emotion/react';
import theme from '../../../Theme';

interface FeedData {
  feedType: string;
  weightKG: string;
}

const FeedsTable: React.FC<React.PropsWithChildren<{ data: FeedData[] }>> = ({
  data,
}) => {
  
  return (
    <ThemeProvider theme={theme}>
      <TableContainer>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell sx={{ color: '#11703b', paddingLeft: 0, textAlign: 'start' }}>
                Feed Type
              </TableCell>
              <TableCell sx={{ color: '#11703b', paddingRight: 0, textAlign: 'end', width: 140 }}>
                Stock
              </TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {data.map((row) => (
              <TableRow key={row.feedType}>
                <TableCell sx={{ paddingLeft: 0, textAlign: 'start', width: 90 }}>
                  {row.feedType}
                </TableCell>
                <TableCell sx={{ color: '#11703b', paddingRight: 0, textAlign: 'end', width: 90 }}>
                  {row.weightKG} KG
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </ThemeProvider>
  );
};

const App = ({ feeds }: { feeds: any[]}) => {
  return <FeedsTable data={feeds} />;
}

export default App;
