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
//             <Typography variant='subtitle1'>Pigpen information</Typography>
//           </Grid22>
//           <Grid22 container sx={{ height: 15 }}></Grid22>
//           <Grid22  size={12} sx={{height:30}}>
//             <Typography variant='subtitle1'>
//               Type: <Typography color='#11703b' fontWeight={400}> {/* type */} Nursery</Typography>
//             </Typography>
//           </Grid22>
//           <Grid22 size={12} sx={{height:30}}>
//             <Typography variant='subtitle1'>
//               Pig Count: <Typography color='#11703b' fontWeight={400}> {/* pigCount */} 2</Typography>
//             </Typography>
//           </Grid22>
//           <Grid22 size={12} sx={{height:30}}>
//             <Typography variant='subtitle1'>
//               Max Pig: <Typography color='#11703b' fontWeight={400}> {/* maxPigs */} 5</Typography>
//             </Typography>
//           </Grid22>
//         </Grid22>
//         <Grid22 size={6} className="rightSide" spacing={5}>
//           <Grid22 size={12} className="pigInfo">
//             <Typography variant='subtitle1'>Pigs Contained</Typography>
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

import {
  Button,
  Grid2,
  Stack,
  ListItem,
  ListItemIcon,
  ListItemText,
  ThemeProvider,
  Typography,
} from '@mui/material'
import CircleIcon from '@mui/icons-material/Circle'
import './PigPen.css'
import theme from '../../../Theme'
import { clamp } from '@mui/x-data-grid/internals'

const pigs = [
  { number: '001', status: 'alive' },
  { number: '002', status: 'sold' },
  { number: '003', status: 'deceased' },
  // ... other pigs
]

const getStatusColor = (status) => {
  switch (status) {
    case 'alive':
      return 'blue'
    case 'sold':
      return 'green'
    case 'deceased':
      return 'red'
    default:
      return 'gray'
  }
}

export default function PenInfo({ selectedRow }) {
  return (
    <ThemeProvider theme={theme}>
      <Grid2
        container
        size={12}
        spacing={3}
        sx={{ paddingX: { xs: 3, sm: 4, lg: 5 } }}
        className="penInfoBg"
      >
        <Grid2
          container
          size={12}
          spacing={0}
          sx={{ paddingY: 5 }}
          className="miniPenInfoBg"
        >
          <Grid2 size={12}>
            <Typography
              sx={{
                fontSize: 'clamp(4rem, 6vw + 1rem, 7rem)',
              }}
              fontWeight={'bold'}
              color="white"
            >
              P-05
              {/* {selectedRow ? selectedRow.number : ''} use this */}
            </Typography>
          </Grid2>
          <Grid2 size={12}>
            <Typography variant="h6" color="white">
              Pen Number
            </Typography>
          </Grid2>
        </Grid2>
        <Grid2 size={12} container sx={{ marginLeft: 4, marginRight: 4 }}>
          <Grid2 size={6} className="leftSide" spacing={5}>
            <Grid2 size={12} className="pigInfo">
              <Typography variant="subtitle1" fontWeight={500}>
                Pigpen information
              </Typography>
            </Grid2>
            <Grid2 container sx={{ height: 15 }}></Grid2>
            <Grid2 size={12} sx={{ height: 30 }}>
              <Typography variant="subtitle1">
                Type:{' '}
                <Typography color="#11703b" fontWeight={400}>
                  {selectedRow ? selectedRow.type : ''}
                </Typography>
              </Typography>
            </Grid2>
            <Grid2 size={12} sx={{ height: 30 }}>
              <Typography variant="subtitle1">
                Pig Count:{' '}
                <Typography color="#11703b" fontWeight={400}>
                  {selectedRow ? selectedRow.pigCount : ''}
                </Typography>
              </Typography>
            </Grid2>
            <Grid2 size={12} sx={{ height: 30 }}>
              <Typography variant="subtitle1">
                Max Pig:{' '}
                <Typography color="#11703b" fontWeight={400}>
                  {selectedRow ? selectedRow.maxPigs : ''}
                </Typography>
              </Typography>
            </Grid2>
          </Grid2>
          <Grid2 size={6} className="rightSide" spacing={5}>
            <Grid2 size={12} className="pigInfo">
              <Typography variant="subtitle1" fontWeight={500}>
                Pigs Contained
              </Typography>
            </Grid2>
            <Grid2 container sx={{ height: 4 }}></Grid2>
            <Grid2 container spacing={0} className="right">
              {pigs.map((pig, index) => (
                <Grid2 size={6} key={index}>
                  <ListItem sx={{ paddingLeft: 2 }}>
                    <ListItemIcon sx={{ minWidth: 30 }}>
                      <CircleIcon
                        sx={{
                          color: getStatusColor(pig.status),
                          fontSize: 'clamp(20px, 2vw, 25px)', // Responsive size
                        }}
                      />
                    </ListItemIcon>

                    <ListItemText primary={pig.number} />
                  </ListItem>
                </Grid2>
              ))}
            </Grid2>
          </Grid2>
        </Grid2>
        {/* <Grid2
          size={12}
          container
          sx={{ marginLeft: 4, marginRight: 4, paddingTop: 3 }}
          className="right"
        >
          <Stack spacing={2} direction="row">
            <Button
              variant="outlined"
              sx={{
                color: '#FF0000',
                borderColor: '#FF0000',
                '&:hover': {
                  color: 'white',
                  backgroundColor: '#d32f2f',
                  borderColor: '#FF0000',
                },
                width: { xs: 60, sm: 70, md: 80, lg: 90 },
                height: { xs: 30, sm: 35, md: 40 },
                borderRadius: 2,
              }}
            >
              <Typography
                sx={{
                  fontWeight: 500,
                  fontSize: 'clamp(11px, 1vw + 5px, 16px)',
                }}
              >
                Delete
              </Typography>
            </Button>
            <Button
              variant="contained"
              sx={{
                backgroundColor: '#3B4DE1',
                '&:hover': { backgroundColor: '#3B4DBF' },
                borderRadius: 2,
                width: { xs: 60, sm: 70, md: 80, lg: 90 },
                height: { xs: 30, sm: 35, md: 40 },
              }}
            >
              <Typography
                sx={{
                  fontWeight: 400,
                  fontSize: 'clamp(11px, 1vw + 5px, 16px)',
                }}
              >
                Edit
              </Typography>
            </Button>
          </Stack>
        </Grid2> */}
      </Grid2>
    </ThemeProvider>
  )
}
