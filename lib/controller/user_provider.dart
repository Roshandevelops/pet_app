import 'package:flutter/material.dart';
import 'package:pet_app/db/adoption_db.dart';
import 'package:pet_app/model/adoption_model/adoption_model.dart';
import 'package:pet_app/model/pet_model.dart';
import 'package:pet_app/service/user_service.dart';

class UserProvider extends ChangeNotifier {
  final UserService userService = UserService();
  final AdoptionDb adoptionDb = AdoptionDb();

  List<PetModel> petList = [];
  List<AdoptionModel> petAdoptionList = [];

  bool isFetchPetsLoading = false;
  bool isFilterApplied = false;

  Future<void> getAllPets() async {
    isFetchPetsLoading = true;
    petList = await userService.getAllPets();
    await getAdoptionData();
    isFetchPetsLoading = false;
    isFilterApplied = false;
    notifyListeners();
  }

  Future<void> getAdoptionData() async {
    petAdoptionList = await adoptionDb.getItem();
    notifyListeners();
  }

  Future<void> filterPets() async {
    isFilterApplied = !isFilterApplied;
    if (isFilterApplied) {
      petList = petList.where((e) => e.isFriendly == true).toList();
    } else {
      await getAllPets();
    }
    notifyListeners();
  }

  Future<void> addAdoptionData(AdoptionModel model) async {
    await adoptionDb.addItem(model);
    await getAdoptionData();
  }
}
