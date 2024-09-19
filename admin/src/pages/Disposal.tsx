import { Grid2 } from "@mui/material"
import DisposalDataTable from "../components/Disposal/DisposalDataTable"
import '../components/Disposal/Disposal.css'
import Dispose from "../components/Disposal/Dispose"

const Disposal = () => {
  return (
    <Grid2 container size={12} spacing={5} className="paddingTop">
      <Grid2 container size={4} className='itemAlign'>
        <Grid2 size={12}>
          <Dispose />
        </Grid2>
      </Grid2>
      <Grid2 container size={8} className='itemAlign'>
        <Grid2 size={12}>
          <p className='feedHistory'>Disposal Records</p>
          <DisposalDataTable />
        </Grid2>
      </Grid2>
    </Grid2>
  )
}

export default Disposal
