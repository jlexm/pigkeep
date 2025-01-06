import { Grid2 } from '@mui/material'
import AddPigComp from './AddPigComponent'
import Cards, { CardData } from './DynamicCard'
import PigStatusLegend from './Legend'
import QRCode from './DLQrcode'
import PigListDataTable from './PigListDataTable'
import { useEffect, useState } from 'react'
import { getSelectedFarm } from '../../../services/farm.service'
import { determinePigStage, fetchAllFarmPigs } from '../../../services/pig.service'
export default function PigList_Screen() {

  const selectedFarm = getSelectedFarm()
  const [pigs, setPigs] = useState<any[]>([])

  useEffect(() => {
    fetchPigs(selectedFarm['_id'])
  },[])

  // Fetch pigs from the selected farm
  const fetchPigs = async (farm_id: string) => {
    const pigs: any[] = (await fetchAllFarmPigs(farm_id) as any) ?? []
    setPigs(pigs.map((pig: any) => {
        return {
          ...pig,
          ...determinePigStage(pig.sex, pig.dob)
          }
        }
      )
    )  
  }

  const pigsCountByCategory: Array<CardData> = Object.values(
      pigs.reduce((acc: Record<string, CardData>, pig: any) => {
        if (!acc[pig.stage]) {
          acc[pig.stage] = { text: pig.stage, number: 0 };
        }
        acc[pig.stage].number += 1;
        return acc;
      }, {} as Record<string, CardData>)
    ).sort((a, b) => b.number - a.number);
  
  const totalLivingPig = pigs.filter((pig: any) => pig.status === 'alive').length

  return (
    <Grid2 container size={12} spacing={{ xs: 2, lg: 5 }}>
      <Grid2
        size={{ xs: 12, sm: 12, md: 3, lg: 3, xl: 2.5 }}
        sx={{ alignContent: { md: 'center' } }}
      >
        <AddPigComp totalPigs={totalLivingPig} />
      </Grid2>
      <Grid2
        size={{ xs: 12, sm: 12, md: 6, lg: 6, xl: 6.5 }}
        className="legendGrid"
      >
        <Cards data={pigsCountByCategory} />
      </Grid2>
      <Grid2
        size={{ xs: 12, sm: 7, md: 1.5, lg: 1.5, xl: 1.5 }}
        className="itemsAlign"
      >
        <PigStatusLegend statuses={['Alive', 'Sold', 'Deceased']} />
      </Grid2>
      <Grid2
        size={{ xs: 12, sm: 5, md: 1.5, lg: 1.5, xl: 1.5 }}
        sx={{ alignContent: 'center' }}
      >
        <QRCode />
      </Grid2>
      <Grid2 container size={12}>
        <PigListDataTable data={pigs} />
      </Grid2>
    </Grid2>
  )
}
