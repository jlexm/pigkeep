class PigHelper {
  static Map<String, String> determinePigStage(DateTime pigDOB) {
    int daysOld = DateTime.now().difference(pigDOB).inDays;
    int weeksOld = (daysOld / 7).abs().floor();

    String stage = 'Nursery';
    String feed = 'Suckling';
    if (weeksOld < 5) {
      stage = 'Nursery';
      feed = 'Suckling';
    } else if (weeksOld < 9) {
      stage = 'Weaner';
      feed = 'Starter';
    } else if (weeksOld <= 16) {
      stage = 'Grower';
      feed = 'Grower';
    } else {
      stage = 'Finisher';
      feed = 'Finisher';
    }
    return {'stage': stage, 'feed': feed};
  }
}
