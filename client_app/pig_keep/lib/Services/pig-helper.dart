import 'package:intl/intl.dart';

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

  static String formatCurrency(double amount) {
    return NumberFormat.currency(
      locale: 'en_US',
      symbol: '₱',
      decimalDigits: 2,
    ).format(amount);
  }

  static String convertVolume(int amount, String unit) {
    if (unit == 'mg') {
      if (amount >= 1000) {
        return '${amount / 1000.0}g';
      } else {
        return '${amount}mg';
      }
    }

    if (unit == 'mL') {
      if (amount >= 1000) {
        return '${amount / 1000.0}L';
      } else {
        return '${amount}mL';
      }
    }
    throw 'Unit not supported.';
  }

  static String formatDate(DateTime date) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('MMMM, d, y');

    if (DateFormat('yMd').format(date) == DateFormat('yMd').format(now)) {
      return 'Today';
    } else {
      return formatter.format(date);
    }
  }

  static String formatToHour(DateTime date) {
    return DateFormat('h:mm a').format(date);
  }
}
