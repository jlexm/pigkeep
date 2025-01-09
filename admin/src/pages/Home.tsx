import { Grid2, ThemeProvider, Typography } from '@mui/material';
import BasicPie from '../components/Home/PieChart';
import SimpleContainer from '../components/Home/HomeContainer';
import FinancialReport from '../components/Home/FinancialReport';
import Guide from '../components/Home/Guide';
import DropdownWithAddButton from '../components/Home/Dropdown';
import theme from '../Theme';
import React, { useEffect, useState } from 'react';
import {
  fetchMyFarms,
  getSelectedFarm,
  setSelectedFarm,
} from '../services/farm.service';
import { determinePigStage, fetchAllFarmPigs } from '../services/pig.service';
import { PieValueType } from '@mui/x-charts';
import { MakeOptional } from '@mui/x-charts/internals';
import { fetchFarmPigEvents } from '../services/pig-events.service';
import { getTodayMidnight, getTodayPlusDays } from '../services/utils.service';
import PigEventsNotification from '../components/Home/Notifications';
import { fetchLedgers } from '../services/ledger.service';
import { fetchFeedsHistoryByFarm } from '../services/feed.service';
import { fetchMedicineHistoryByFarm } from '../services/medicines.service';

const Home: React.FC = () => {
  const localStorageSelectedFarm = getSelectedFarm();

  // Default selected farm
  const [selectedOption, setSelectedOption] = useState<any>(
    localStorageSelectedFarm
  );
  const [options, setOptions] = useState<any[]>([]);

  const [pigs, setPigs] = useState<any[]>([]);
  const [pigEvents, setPigEvents] = useState<any[]>([]);
  const [ledgers, setLedgers] = useState<any[]>([]);
  const [feedHistory, setFeedHistory] = useState<any[]>([]);
  const [medicineHistory, setMedicineHistory] = useState<any[]>([]);

  // Fetch all farms and set the default selected farm
  useEffect(() => {
    (async () => {
      const myFarms = (await fetchMyFarms()) as any;
      setOptions(myFarms);
      if (!selectedOption) {
        const selectedFarm = myFarms[0];
        setSelectedOption(selectedFarm);
        setSelectedFarm(selectedFarm);
      }
    })();
  }, []);

  // Fetch api data when selected farm changes
  useEffect(() => {
    if (selectedOption) {
      const farm_id = selectedOption['_id'];
      fetchPigs(farm_id);
      fetchPigEvents(farm_id);
      fetchLedgersData(farm_id);
      fetchFeedsHistoryData(farm_id);
      fetchMedsHistoryData(farm_id);
    }
  }, [selectedOption]);

  // Fetch pigs from the selected farm
  const fetchPigs = async (farm_id: string) => {
    const pigs: any[] = ((await fetchAllFarmPigs(farm_id)) as any) ?? [];
    setPigs(
      pigs.map((pig: any) => {
        return {
          ...pig,
          ...determinePigStage(pig.sex, pig.dob),
        };
      })
    );
  };

  const fetchPigEvents = async (farm_id: string) => {
    const pigEvents: any[] = ((await fetchFarmPigEvents(farm_id)) as any) ?? [];
    const today = getTodayMidnight();
    const next2Weeks = getTodayPlusDays(14);
    setPigEvents(
      pigEvents
        .filter(
          (event: any) =>
            event.status !== 'Completed' &&
            new Date(event.eventDate) >= today &&
            new Date(event.eventDate) <= next2Weeks
        )
        .sort(
          (a, b) =>
            new Date(a.eventDate).getTime() - new Date(b.eventDate).getTime()
        )
    );
  };

  const fetchLedgersData = async (farm_id: string) => {
    const ledgers: any[] = ((await fetchLedgers(farm_id)) as any) ?? [];
    setLedgers(ledgers);
  };

  const fetchFeedsHistoryData = async (farm_id: string) => {
    const feeds: any[] =
      ((await fetchFeedsHistoryByFarm(farm_id)) as any) ?? [];
    setFeedHistory(feeds);
  };

  const fetchMedsHistoryData = async (farm_id: string) => {
    const meds: any[] =
      ((await fetchMedicineHistoryByFarm(farm_id)) as any) ?? [];
    setMedicineHistory(
      meds.map((med: any) => ({ ...med, totalCost: med.cost * med.quantity }))
    );
  };

  //  Pie chart data
  const pigsPieData: MakeOptional<PieValueType, 'id'>[] = Object.values(
    pigs.reduce(
      (acc: Record<string, MakeOptional<PieValueType, 'id'>>, pig: any) => {
        if (!acc[pig.stage]) {
          acc[pig.stage] = { id: pig.stage, label: pig.stage, value: 0 };
        }
        acc[pig.stage].value += 1;
        return acc;
      },
      {} as Record<string, MakeOptional<PieValueType, 'id'>>
    )
  ).sort((a, b) => b.value - a.value);

  const handleAddNewItem = (newItem: string) => {
    setOptions((prevOptions) => [...prevOptions, newItem]);
  };

  return (
    <ThemeProvider theme={theme}>
      <Grid2
        container
        spacing={10}
        sx={{
          paddingX: { xs: 2, sm: 5, md: 15, lg: 20, xl: 25 },
          paddingBottom: 5,
          paddingTop: { xs: 2, sm: 5 },
        }}
      >
        <Grid2 container spacing={2} size={12}>
          <Grid2 size={{ xs: 8, sm: 5, md: 6, lg: 5 }}>
            <DropdownWithAddButton
              options={options}
              selected={selectedOption} // Pass the selected option
              onAddNewItem={handleAddNewItem}
              handleSetSelectedOption={setSelectedOption}
            />
          </Grid2>
          <SimpleContainer total_pigs={pigs.length} />
        </Grid2>
        <Grid2 size={{ xs: 12, lg: 6 }}>
          <BasicPie data={pigsPieData} />
        </Grid2>
        <Grid2 size={{ xs: 12, lg: 6 }}>
          <PigEventsNotification pigEvents={pigEvents} />
        </Grid2>
        <Grid2 size={12}>
          <FinancialReport
            ledgers={ledgers}
            feedHistory={feedHistory}
            medicineHistory={medicineHistory}
          />
        </Grid2>
        <Grid2 size={12}>
          <Guide />
        </Grid2>
        <Grid2 size={12}>
          <Typography variant="subtitle1" className="quote" fontWeight={400}>
            PigKeep. Pig management, done in your pocket.
          </Typography>
        </Grid2>
        <Grid2 container size={12} spacing={0}>
          <Grid2
            size={{ xs: 12, md: 6 }}
            sx={{ textAlign: { xs: 'center', md: 'start' } }}
          >
            <Typography variant="body1" color="black">
              Developed by Maravilla & Talagtag
            </Typography>
          </Grid2>
          <Grid2
            size={{ xs: 12, md: 6 }}
            sx={{ textAlign: { xs: 'center', md: 'end' } }}
          >
            <Typography variant="body1" color="black">
              Naga City, Philippines
            </Typography>
          </Grid2>
          <Grid2
            size={{ xs: 12, md: 6 }}
            sx={{ textAlign: { xs: 'center', md: 'start' } }}
          >
            <Typography variant="body1" color="black">
              2024-All Rights Reserved.
            </Typography>
          </Grid2>
        </Grid2>
      </Grid2>
    </ThemeProvider>
  );
};

export default Home;
