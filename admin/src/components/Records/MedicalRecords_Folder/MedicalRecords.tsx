import { Grid2, ThemeProvider, Typography } from '@mui/material'
import AddMedComp from './AddMed'
import MedInvDataTable from './MedInvDataTable'
import theme from '../../../Theme'
import { getSelectedFarm } from '../../../services/farm.service'
import { useEffect, useState } from 'react'
import { fetchMedicineByFarm, fetchMedicineHistoryByFarm } from '../../../services/medicines.service'

export default function MedicalRecords_Screen() {

    const localStorageSelectedFarm = getSelectedFarm()

    const [medicine, setMedicine] = useState<any[]>([])
    const [medicineHistory, setMedicineHistory] = useState<any[]>([]) 
  
    // init meds page
    useEffect(() => {
      if(!localStorageSelectedFarm) {
        throw new Error('No farm selected')
      }
      const farm_id = localStorageSelectedFarm['_id']
      fetchMedicine(farm_id)
      fetchMedicineHistory(farm_id)
    }, [])
  
    const fetchMedicine = async (farm_id: string) => {
      const farmMedicine = (await fetchMedicineByFarm(farm_id) as any) ?? []
      setMedicine(farmMedicine)
    }
  
    const fetchMedicineHistory = async (farm_id: string) => {
      const farmMedicineHistory = (await fetchMedicineHistoryByFarm(farm_id) as any) ?? []
      setMedicineHistory(
        farmMedicineHistory
        .map((med: any) => ({...med, totalCost: med.cost * med.quantity}))
        .sort((a: any, b: any) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime()))
    }

  return (
    <ThemeProvider theme={theme}>
      <Grid2 container size={12} spacing={5}>
        <Grid2 container size={{ xs: 12, lg: 4 }}>
          <Grid2 size={12}>
            <AddMedComp medicine={medicine} medicineHistory={medicineHistory} />
          </Grid2>
        </Grid2>
        <Grid2
          container
          spacing={2}
          size={{ xs: 12, lg: 8 }}
          sx={{ placeContent: 'flex-start' }}
        >
          <Grid2 size={12}>
            <Typography
              variant="h5"
              fontWeight={'bold'}
              color="black"
              textAlign= 'start'
            >
              Medical History
            </Typography>
            <Grid2>
              <MedInvDataTable medicineHistory={medicineHistory} />
            </Grid2>
          </Grid2>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  )
}
