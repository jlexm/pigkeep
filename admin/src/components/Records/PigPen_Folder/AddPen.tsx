// import { Button, Grid2 } from '@mui/material'
// import './PigPen.css'
// import AddCircleIcon from '@mui/icons-material/AddCircle'
// import PigpenDataTable from './PigPenDataTable'
// import ReusableDialogBox from '../../../modals/ReusableDialogBox';
// import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike';
// import { useState } from 'react';

// export default function AddPenComp() {
//  // State to manage the dialog box visibility
//  const [openDialog, setOpenDialog] = useState(false);

//  // Function to open the dialog
//  const handleOpenDialog = () => {
//    setOpenDialog(true);
//  };

//  // Function to close the dialog
//  const handleCloseDialog = () => {
//    setOpenDialog(false);
//  };

//  // Function to handle save action in the dialog
//  const handleSave = () => {
//    console.log('Saving pig data...');
//    handleCloseDialog(); // Close dialog after saving
//  };

//   return (
//     <>
//     <Grid2 container size={12} spacing={1}>
//       <Grid2 container size={12} className="penContainer" spacing={0}>
//         <Grid2 size={2} className="penHeadTitle">
//           <p className="penTitle">05</p>
//         </Grid2>
//         <Grid2 size={3} className="center">
//           <p className="sidePen">Total Pigpens</p>
//         </Grid2>
//         <Grid2 className="addButton" size={7}>
//           <Button
//             variant="contained"
//             startIcon={<AddCircleIcon fontSize="large" />}
//             sx={{
//               height: 47,
//               color: 'black',
//               backgroundColor: 'white',
//               borderRadius: '10px',
//               fontWeight: 'bold',
//               fontSize: '17px',
//               '& .MuiButton-startIcon': {
//                 marginRight: '8px',
//               },
//             }}
//             onClick={handleOpenDialog} 
//           >
//             Add Pen
//           </Button>
//         </Grid2>
//       </Grid2>
//       <Grid2 container size={12} spacing={1}>
//         <Grid2 size={12} className="left">
//           <p className="margin0">Pigpen Summary</p>
//         </Grid2>
//         <Grid2 size={12}>
//         <PigpenDataTable />
//         </Grid2>
//       </Grid2>
//     </Grid2>

//     {/* ReusableDialogBox to be shown when openDialog is true */}
//     {openDialog && (
//         <ReusableDialogBox
//           title="Add Pen"
//           description="Fill up the necessary information."
//           formFields={[
//             {
//               placeholder: "Pen Type",
//               icon: <DirectionsBikeIcon />,
//             },
//             {
//               placeholder: "Maximum Number",
//               icon: <DirectionsBikeIcon />,
//             },
//           ]}
//           onSave={handleSave} // Handle save action
//           onCancel={handleCloseDialog} // Handle cancel action
//           saveButtonText="Add Pen"
//           saveButtonColor="#11703b" // Green color for the save button
//         />
//       )}
//     </>
//   )
// }


import { Button, Grid2 } from '@mui/material';
import './PigPen.css';
import AddCircleIcon from '@mui/icons-material/AddCircle';
import PigpenDataTable from './PigPenDataTable';
import ReusableDialogBox from '../../../modals/ReusableDialogBox';
import DirectionsBikeIcon from '@mui/icons-material/DirectionsBike';
import { useState } from 'react';

export default function AddPenComp() {
  // State to manage the dialog box visibility
  const [openDialog, setOpenDialog] = useState(false);
  // State to hold selected row data
  const [selectedRow, setSelectedRow] = useState(null);

  // Function to open the dialog
  const handleOpenDialog = () => {
    setOpenDialog(true);
  };

  // Function to close the dialog
  const handleCloseDialog = () => {
    setOpenDialog(false);
  };

  // Function to handle save action in the dialog
  const handleSave = () => {
    console.log('Saving pig data...');
    handleCloseDialog(); // Close dialog after saving
  };

  // Function to handle row selection from the data table
  const handleRowSelect = (rowData) => {
    setSelectedRow(rowData);
    console.log('Selected Row:', rowData);
  };

  return (
    <>
      <Grid2 container size={12} spacing={1}>
        <Grid2 container size={12} className="penContainer" spacing={0}>
          <Grid2 size={2} className="penHeadTitle">
            <p className="penTitle">05</p>
          </Grid2>
          <Grid2 size={3} className="center">
            <p className="sidePen">Total Pigpens</p>
          </Grid2>
          <Grid2 className="addButton" size={7}>
            <Button
              variant="contained"
              startIcon={<AddCircleIcon fontSize="large" />}
              sx={{
                height: 47,
                color: 'black',
                backgroundColor: 'white',
                borderRadius: '10px',
                fontWeight: 'bold',
                fontSize: '17px',
                '& .MuiButton-startIcon': {
                  marginRight: '8px',
                },
              }}
              onClick={handleOpenDialog}
            >
              Add Pen
            </Button>
          </Grid2>
        </Grid2>
        <Grid2 container size={12} spacing={1}>
          <Grid2 size={12} className="left">
            <p className="margin0">Pigpen Summary</p>
          </Grid2>
          <Grid2 size={12}>
            <PigpenDataTable onRowSelect={undefined} />
          </Grid2>
        </Grid2>
      </Grid2>

      {/* ReusableDialogBox to be shown when openDialog is true */}
      {openDialog && (
        <ReusableDialogBox
          title="Add Pen"
          description="Fill up the necessary information."
          formFields={[
            {
              placeholder: "Pen Type",
              icon: <DirectionsBikeIcon />,
            },
            {
              placeholder: "Maximum Number",
              icon: <DirectionsBikeIcon />,
            },
          ]}
          onSave={handleSave} // Handle save action
          onCancel={handleCloseDialog} // Handle cancel action
          saveButtonText="Add Pen"
          saveButtonColor="#11703b" // Green color for the save button
        />
      )}
    </>
  );
}
