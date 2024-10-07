class PigHelper {
  static Map<String, String> determinePigStage(bool isMale, DateTime pigDOB) {
    int daysOld = DateTime.now().difference(pigDOB).inDays;
    // int weeksOld = (daysOld / 7).abs().floor();

    String stage = 'Piglet';
    String feed = 'Booster';
    if (daysOld <= 35) {
      stage = 'Piglet';
      feed = 'Booster';
    } else if (daysOld <= 80) {
      stage = 'Weaner';
      if (daysOld <= 45) {
        feed = 'Pre-Starter';
      } else {
        feed = 'Starter';
      }
    } else if (daysOld <= 123) {
      stage = 'Grower';
      feed = 'Grower';
    } else {
      stage = 'Matured';
      if (daysOld >= 182) {
        if (isMale) {
          stage = 'Boar';
        } else
          stage = 'Sow';
      }
      feed = 'Finisher';
    }

    String age = 'N/A';
    if (daysOld < 7) {
      age = '${daysOld} day/s old';
    } else if (daysOld < 30) {
      age = '${(daysOld / 7).abs().floor()} week/s old';
    } else if (daysOld < 365) {
      age = '${(daysOld / 30).abs().floor()} month/s old';
    } else {
      age = '${(daysOld / 365).abs().floor()} year/s old';
    }

    return {'stage': stage, 'feed': feed, 'age': age};
  }
}
