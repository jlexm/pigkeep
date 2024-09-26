// import { Button, Grid22, Stack, ListItem, ListItemIcon, ListItemText } from '@mui/material'
// import CircleIcon from '@mui/icons-material/Circle'
// import './PigPen.css'

// const pigs = [
//   { number: '001', status: 'alive' },
//   { number: '002', status: 'sold' },
//   { number: '003', status: 'deceased' },
//   { number: '004', status: 'alive' },
//   { number: '005', status: 'alive' },
//   { number: '006', status: 'deceased' },
//   { number: '007', status: 'alive' },
//   { number: '008', status: 'sold' },

// ]

// const getStatusColor = (status: string) => {
//   switch (status) {
//     case 'alive':
//       return 'blue'
//     case 'sold':
//       return 'green'
//     case 'deceased':
//       return 'red'
//     default:
//       return 'gray'
//   }
// }

// export default function PenInfo() {
//   return (
//     <Grid22 container size={12} spacing={3} className="penInfoBg">
//       <Grid22 container size={12} spacing={0} className="miniPenInfoBg">
//         <Grid22  size={12}>
//           <p className="size100">P-01</p>
//         </Grid22>
//         <Grid22  size={12}>
          
//           <text style={{ fontSize: 20 }}>{/* number */}Pen Number</text>
//         </Grid22>
//       </Grid22>
//       <Grid22 size={12} container sx={{ marginLeft: 4, marginRight: 4 }}>
//         <Grid22  size={6} className="leftSide" spacing={5}>
//           <Grid22  size={12} className="pigInfo">
//             <text>Pigpen information</text>
//           </Grid22>
//           <Grid22 container sx={{ height: 15 }}></Grid22>
//           <Grid22  size={12} sx={{height:30}}>
//             <text>
//               Type: <span className="green"> {/* type */} Nursery</span>
//             </text>
//           </Grid22>
//           <Grid22 size={12} sx={{height:30}}>
//             <text>
//               Pig Count: <span className="green"> {/* pigCount */} 2</span>
//             </text>
//           </Grid22>
//           <Grid22 size={12} sx={{height:30}}>
//             <text>
//               Max Pig: <span className="green"> {/* maxPigs */} 5</span>
//             </text>
//           </Grid22>
//         </Grid22>
//         <Grid22 size={6} className="rightSide" spacing={5}>
//           <Grid22 size={12} className="pigInfo">
//             <text>Pigs Contained</text>
//           </Grid22>
//           <Grid22 container sx={{ height: 4 }}></Grid22>
//           <Grid22 container spacing={0} className='right'>
//             {pigs.map((pig, index) => (
//               <Grid22 size={6} key={index} > 
//                 <ListItem sx={{ paddingLeft: 2 }}>
//                   <ListItemIcon sx={{ minWidth: 30 }}>
//                     <CircleIcon sx={{ color: getStatusColor(pig.status) }} />
//                   </ListItemIcon>
//                   <ListItemText primary={pig.number} />
//                 </ListItem>
//               </Grid22>
//             ))}
//           </Grid22>
//         </Grid22>
//       </Grid22>
//       <Grid22 size={12} container sx={{ marginLeft: 4, marginRight: 4, paddingTop:3 }} className="right">
//         <Stack spacing={2} direction="row">
//           <Button
//             variant="contained"
//             sx={{
//               backgroundColor: '#3B4DE1',
//               '&:hover': { backgroundColor: '#3B4DBF' },
//               width:90,
//               borderRadius:2,
//             }}
//           >
//             Edit
//           </Button>
//           <Button
//             variant="contained"
//             sx={{
//               backgroundColor: '#FF0000',
//               '&:hover': { backgroundColor: '#d32f2f' },
//               width:90,
//               borderRadius:2,
//             }}
//           >
//             Delete
//           </Button>
//         </Stack>
//       </Grid22>
//     </Grid22>
//   )
// }



import { Button, Grid2, Stack, ListItem, ListItemIcon, ListItemText } from '@mui/material';
import CircleIcon from '@mui/icons-material/Circle';
import './PigPen.css';

const pigs = [
  { number: '001', status: 'alive' },
  { number: '002', status: 'sold' },
  { number: '003', status: 'deceased' },
  // ... other pigs
];

const getStatusColor = (status) => {
  switch (status) {
    case 'alive':
      return 'blue';
    case 'sold':
      return 'green';
    case 'deceased':
      return 'red';
    default:
      return 'gray';
  }
};

export default function PenInfo({ selectedRow }) {
  return (
    <Grid2 container size={12} spacing={3} className="penInfoBg">
      <Grid2 container size={12} spacing={0} className="miniPenInfoBg">
        <Grid2 size={12}>
          <p className="size100">{selectedRow ? selectedRow.number : ''}</p>
        </Grid2>
        <Grid2 size={12}>
          <text style={{ fontSize: 20, color: "white" }}>Pen Number</text>
        </Grid2>
      </Grid2>
      <Grid2 size={12} container sx={{ marginLeft: 4, marginRight: 4 }}>
        <Grid2 size={6} className="leftSide" spacing={5}>
          <Grid2 size={12} className="pigInfo">
            <text>Pigpen information</text>
          </Grid2>
          <Grid2 container sx={{ height: 15 }}></Grid2>
          <Grid2 size={12} sx={{ height: 30 }}>
            <text>
              Type: <span className="green">{selectedRow ? selectedRow.type : ''}</span>
            </text>
          </Grid2>
          <Grid2 size={12} sx={{ height: 30 }}>
            <text>
              Pig Count: <span className="green">{selectedRow ? selectedRow.pigCount : ''}</span>
            </text>
          </Grid2>
          <Grid2 size={12} sx={{ height: 30 }}>
            <text>
              Max Pig: <span className="green">{selectedRow ? selectedRow.maxPigs : ''}</span>
            </text>
          </Grid2>
        </Grid2>
        <Grid2 size={6} className="rightSide" spacing={5}>
          <Grid2 size={12} className="pigInfo">
            <text>Pigs Contained</text>
          </Grid2>
          <Grid2 container sx={{ height: 4 }}></Grid2>
          <Grid2 container spacing={0} className='right'>
            {pigs.map((pig, index) => (
              <Grid2 size={6} key={index}>
                <ListItem sx={{ paddingLeft: 2 }}>
                  <ListItemIcon sx={{ minWidth: 30 }}>
                    <CircleIcon sx={{ color: getStatusColor(pig.status) }} />
                  </ListItemIcon>
                  <ListItemText primary={pig.number} />
                </ListItem>
              </Grid2>
            ))}
          </Grid2>
        </Grid2>
      </Grid2>
      <Grid2 size={12} container sx={{ marginLeft: 4, marginRight: 4, paddingTop: 3 }} className="right">
        <Stack spacing={2} direction="row">
          <Button
            variant="contained"
            sx={{
              backgroundColor: '#3B4DE1',
              '&:hover': { backgroundColor: '#3B4DBF' },
              width: 90,
              borderRadius: 2,
            }}
          >
            Edit
          </Button>
          <Button
            variant="contained"
            sx={{
              backgroundColor: '#FF0000',
              '&:hover': { backgroundColor: '#d32f2f' },
              width: 90,
              borderRadius: 2,
            }}
          >
            Delete
          </Button>
        </Stack>
      </Grid2>
    </Grid2>
  );
}
