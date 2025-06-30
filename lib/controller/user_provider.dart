import 'package:flutter/material.dart';
import 'package:pet_app/model/pet_model.dart';
import 'package:pet_app/service/user_service.dart';

class UserProvider extends ChangeNotifier {
  final UserService userService = UserService();
  List<PetModel> petList = [];

  bool isFetchPetsLoading = false;
  bool isFilterApplied = false;

  Future<void> getData() async {
    isFetchPetsLoading = true;
    petList = await userService.getAllPets();
    isFetchPetsLoading = false;
    isFilterApplied = false;
    notifyListeners();
  }

  Future<void> filterPets() async {
    isFilterApplied = !isFilterApplied;
    if (isFilterApplied) {
      petList = petList.where((e) => e.isFriendly == true).toList();
    } else {
      await getData();
    }

    notifyListeners();
  }
}
