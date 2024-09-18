import { Button, Grid2 } from '@mui/material'
import '../PigList_Folder/PigList.css'
import AddCircleIcon from '@mui/icons-material/AddCircle'

export default function AddPigComp() {
  return (
    <Grid2 container className="addPig">
      <Grid2 size={4.5} className="textAlign-left">
        <text className="pigTotal">44</text>
      </Grid2>
      <Grid2 className="total" size={3}>
        <text>
          Total <br />
          Living Pigs
        </text>
      </Grid2>
      <Grid2 className="addButton" size={4.5}>
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
        >
          Add Pig
        </Button>
      </Grid2>
    </Grid2>
  )
}
