import 'package:isar/isar.dart';
import 'package:pig_keep/Models/medicine-history.dart';
import 'package:pig_keep/Models/medicine.dart';
import 'package:pig_keep/Models/pig.dart';
import 'package:pig_keep/Services/database-service.dart';
import 'package:pig_keep/Services/pig-helper.dart';
import 'package:pig_keep/main.dart';

class MedicineService {
  Isar db = globalLocator.get<DatabaseService>().db;

  Future<void> addMedicine(
      bool isEditMode,
      String farmID,
      String status,
      String medicineName,
      String? dosage,
      String? description,
      int quantity,
      double cost,
      String? pigUUID) async {
    if (quantity <= 0) {
      throw 'Invalid Quantity Value';
    }

    // upsert med type
    var med = await db.medicines
        .filter()
        .medicineNameEqualTo(medicineName)
        .findFirst();
    if (med == null) {
      if (status == 'consumed') {
        throw 'Cannot consume non existing medicine';
      }
      if (dosage == null) {
        throw 'Dosage is required. Example: 10mg';
      }
      // perform insert med
      med = Medicine()
        ..farmID = farmID
        ..medicineName = medicineName
        ..dosage = dosage
        ..description = description ?? ''
        ..quantity = quantity
        ..avgCost = cost; // calculate cost per grams or liters
    } else {
      // perform update med
      if (status == 'stock') {
        med.avgCost = cost;
      }
      med.quantity += status == 'stock'
          ? quantity
          : -quantity; // if stock add, consume minus

      if (med.quantity < 0) {
        throw 'Not enough stock available';
      }
      med.updatedAt = DateTime.now();
    }

    if (isEditMode) {
      med.quantity = quantity;
      await db.writeTxn(() async {
        await db.medicines.put(med!);
      });
    } else {
      // add med history
      final medHistory = MedicineHistory()
        ..farmID = farmID
        ..cost = cost
        ..medicineName = medicineName
        ..quantity = quantity
        ..status = status
        ..dosage = med.dosage
        ..pigUuid = pigUUID;

      await db.writeTxn(() async {
        await db.medicines.put(med!);
        await db.medicineHistorys.put(medHistory);
      });
    }
  }

  Future<List<Medicine>> getMedicines(String farmID) async {
    return await db.medicines.filter().farmIDEqualTo(farmID).findAll();
  }

  Future<List<Map<String, dynamic>>> getMedicineTransactions(
      String farmID) async {
    final meds = await db.medicineHistorys
        .filter()
        .farmIDEqualTo(farmID)
        .sortByCreatedAtDesc()
        .findAll();

    List<Map<String, dynamic>> medHistories = [];

    for (var med in meds) {
      Pig? pig;
      if (med.pigUuid != null) {
        pig = await db.pigs.filter().uuidEqualTo(med.pigUuid!).findFirst();
      }

      medHistories.add({
        'medicineName': med.medicineName,
        'cost': med.cost,
        'createdAt': med.createdAt,
        'pigUuid': med.pigUuid,
        'pigNumber': pig != null ? pig.pigNumber : null,
        'status': med.status,
        'quantity': med.quantity,
        'dosage': med.dosage,
      });
    }

    return medHistories;
  }
}
