import 'package:hive_flutter/adapters.dart';
import 'package:pet_app/model/adoption_model/adoption_model.dart';

const String adoptDbName = "ADOPT_DB_NAME";

class AdoptionDb {
  Future<void> addItem(AdoptionModel adoptionModel) async {
    final adoptDB = await Hive.openBox<AdoptionModel>(adoptDbName);
    await adoptDB.add(adoptionModel);
  }

  Future<List<AdoptionModel>> getItem() async {
    final adoptDB = await Hive.openBox<AdoptionModel>(adoptDbName);
    return adoptDB.values.toList();
  }
}
