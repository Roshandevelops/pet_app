import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:pet_app/model/pet_model.dart';

class UserService {
  Future<List<PetModel>> getAllPets() async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://jatinderji.github.io/users_pets_api/users_pets.json"),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map;

        final result = (json["data"] as List).map(
          (e) {
            return PetModel.fromJson(e);
          },
        ).toList();

        log(result.toString());

        return result;
      } else {
        return [];
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
