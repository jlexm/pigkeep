import * as React from 'react';
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  IconButton,
} from '@mui/material';
import IndeterminateCheckBoxIcon from '@mui/icons-material/IndeterminateCheckBox';
import ReusableDialogBox from '../../../modals/ReusableDialogBox'; // Adjust the import path as needed
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike';

interface MedicalData {
  medicineName: string;
  dosage: string; 
  quantity: number;
  consume: number;
}

const MedicalTable: React.FC<React.PropsWithChildren<{ data: MedicalData[] }>> = ({
  data,
}) => {
  // State to manage the dialog box visibility
  const [openDialog, setOpenDialog] = React.useState(false);
  const [selectedRow, setSelectedRow] = React.useState<MedicalData | null>(null); // State to manage selected row data

  // Function to open the dialog
  const handleOpenDialog = (row: MedicalData) => {
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
    console.log('Saving consume data for:', selectedRow);
    handleCloseDialog(); // Close dialog after saving
  };

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
              {/* <TableCell
                sx={{
                  color: '#3B4DE1',
                  paddingRight: 0,
                  textAlign: 'end',
                  width: 30,
                }}
              >
                Consume
              </TableCell> */}
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
                {/* <TableCell sx={{
                  paddingRight: 0,
                  textAlign: 'end',
                  width: 90,
                }}>
                  <IconButton
                    aria-label="consume"
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
              Consume <span style={{ color: '#3B4DE1' }}>{selectedRow.medicineName}</span>
            </>
          } 
          description="Fill up the necessary information."
          formFields={[{
            placeholder: "Quantity",
            icon: <DirectionsBikeIcon />,
          }]}
          onSave={handleSave} // Handle save action
          onCancel={handleCloseDialog} // Handle cancel action
          saveButtonText="Consume"
          saveButtonColor="#FF0000" // Red color for the save button
        />
      )}
    </>
  );
};

const App = ({ medicine }: { medicine: any[]}) => {
  return <MedicalTable data={medicine} />;
}

export default App;
