import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 1)
class AdoptionModel {

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final int? age;

  @HiveField(3)
  final String? gender;

  @HiveField(4)
  final String? noOfPets;

  AdoptionModel({
    required this.name,
    required this.age,
    required this.gender,
    required this.noOfPets,
  });
}
