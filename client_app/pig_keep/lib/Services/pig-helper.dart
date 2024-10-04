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
    return {'stage': stage, 'feed': feed};
  }
}
