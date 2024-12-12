import 'package:pig_keep/Api/api.dart';
import 'package:pig_keep/Models/pig-pen.dart';

class PenApi {
  static syncPen(String farmID, List<PigPen> pens) {
    // format pens to json
    List<Map<String, dynamic>> pensJSON = pens.map((pen) {
      return {
        'farmID': pen.farmID,
        'uuid': pen.uuid,
        'userOwner': pen.userOwner,
        'penNumber': pen.penNumber,
        'penType': pen.penType,
        'maxPigCount': pen.maxPigCount,
        'currentPigCount': pen.currentPigCount,
        'createdAt': pen.createdAt.toIso8601String(),
        'updatedAt': pen.updatedAt.toIso8601String(),
      };
    }).toList();

    return API.post('/pens/syncable/${farmID}', {'pens': pensJSON});
  }

  static getSyncablePen(String farmID, DateTime? lastSuccessfulReadSync) {
    final queryParams = lastSuccessfulReadSync != null
        ? '?last_successful_read_sync=${Uri.encodeComponent(lastSuccessfulReadSync.toIso8601String())}'
        : '';
    final url = '/pens/syncable/$farmID$queryParams';
    return API.get(url);
  }
}
