import apiClient from "./api.service"

const PIG_BASE = '/pigs'

export const fetchAllFarmPigs = (farm_id: string) => {
  return apiClient.get(`${PIG_BASE}/farm/${farm_id}`)
}

export const determinePigStage = (isMale: boolean, pigDOB: string) => {

  const daysOld = Math.abs(Math.floor((new Date().getTime() - new Date(pigDOB).getTime()) / (1000 * 60 * 60 * 24)));

  let pigletDays = 35;
  let weanerDays = 80;
  let growerDays = 123;
  let maturedDays = 182;

  let stage = 'Piglet';
  let feed = 'Booster';

  if (daysOld <= pigletDays) {
    stage = 'Piglet';
    feed = 'Booster';
  } else if (daysOld <= weanerDays) {
    stage = 'Weaner';
    feed = daysOld <= 45 ? 'Pre-Starter' : 'Starter';
  } else if (daysOld <= growerDays) {
    stage = 'Grower';
    feed = 'Grower';
  } else {
    stage = 'Matured';
    if (daysOld >= maturedDays) {
      stage = isMale ? 'Boar' : 'Sow';
    }
    feed = 'Finisher';
  }

  let age = 'N/A';
  if (daysOld < 7) {
    age = `${daysOld} day/s old`;
  } else if (daysOld < 30) {
    age = `${Math.abs(Math.floor(daysOld / 7))} week/s old`;
  } else if (daysOld < 365) {
    age = `${Math.abs(Math.floor(daysOld / 30))} month/s old`;
  } else {
    age = `${Math.abs(Math.floor(daysOld / 365))} year/s old`;
  }

  return { stage, feed, age };
};
