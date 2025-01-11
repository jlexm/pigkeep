import { Grid2 } from '@mui/material';

import AddPenComp from './AddPen';
import PenInfo from './PenInfo';
import { getSelectedFarm } from '../../../services/farm.service';
import { useEffect, useState } from 'react';
import { getAllPensByFarm } from '../../../services/pen.service';

export default function Pigpen_Screen() {
  const localStorageSelectedFarm = getSelectedFarm();
  const [pens, setPens] = useState<any[]>([]);
  const [selectedPen, setSelectedPen] = useState<any>();

  useEffect(() => {
    if (!localStorageSelectedFarm) {
      throw new Error('No farm selected');
    }
    const farm_id = localStorageSelectedFarm['_id'];
    getPensData(farm_id);
  }, []);

  async function getPensData(farm_id: string) {
    // Fetch pens data
    const farmPens = ((await getAllPensByFarm(farm_id)) as any) ?? [];
    setPens(farmPens);
  }

  return (
    <Grid2 container size={12} spacing={5}>
      <Grid2 container size={{ xs: 12, md: 6 }}>
        <AddPenComp pens={pens} onRowSelect={setSelectedPen} />
      </Grid2>
      <Grid2 container size={{ xs: 12, md: 6 }} className="itemAlign">
        <PenInfo selectedRow={selectedPen} />
      </Grid2>
    </Grid2>
  );
}
