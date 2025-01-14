import * as React from 'react';
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
} from '@mui/material';
import ReusableDialogBox from '../../../modals/ReusableDialogBox'; // Adjust the import path as needed
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike';
import { ThemeProvider } from '@emotion/react';
import theme from '../../../Theme';

interface FeedData {
  feedType: string;
  weightKG: string;
}

const FeedsTable: React.FC<React.PropsWithChildren<{ data: FeedData[] }>> = ({
  data,
}) => {
  // State to manage the dialog box visibility
  const [openDialog, setOpenDialog] = React.useState(false);
  const [selectedRow, setSelectedRow] = React.useState<FeedData | null>(null); // State to manage selected row data

  // Function to open the dialog
  const handleOpenDialog = (row: FeedData) => {
    setSelectedRow(row); // Set the selected row data
    setOpenDialog(true); // Open the dialog
  };

  // Function to close the dialog
  const handleCloseDialog = () => {
    setOpenDialog(false);
    setSelectedRow(null); // Reset selected row data
  };

  // Function to handle save action in the dialog
  const handleSave = () => {
    console.log('Saving pig data...');
    handleCloseDialog(); // Close dialog after saving
  };

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
              {/* <TableCell sx={{ color: '#11703b', paddingRight: 0, textAlign: 'end', width: 30 }}>
                Consume
              </TableCell> */}
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
                {/* <TableCell sx={{ paddingRight: 0, textAlign: 'end', width: 90 }}>
                  <IconButton
                    aria-label="delete"
                    color='error'
                    onClick={() => handleOpenDialog(row)} // Open dialog with row data
                  >
                    <IndeterminateCheckBoxIcon />
                  </IconButton>
                </TableCell> */}
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>

      {/* ReusableDialogBox to be shown when openDialog is true */}
      {openDialog && selectedRow && (
        <ReusableDialogBox
          title={
            <>
              Consume <span style={{ color: '#11703b' }}>{selectedRow.feedType}</span>
            </>
          } 
          description="Fill up the necessary information."
          formFields={[
            {
              placeholder: "Weight in kg",
              icon: <DirectionsBikeIcon />,
            },
          ]}
          onSave={handleSave} // Handle save action
          onCancel={handleCloseDialog} // Handle cancel action
          saveButtonText="Consume"
          saveButtonColor="#FF0000" // Red color for the save button
        />
      )}
    </ThemeProvider>
  );
};

const App = ({ feeds }: { feeds: any[]}) => {
  return <FeedsTable data={feeds} />;
}

export default App;
