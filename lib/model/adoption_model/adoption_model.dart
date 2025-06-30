import 'package:hive_flutter/adapters.dart';
part 'adoption_model.g.dart';


@HiveType(typeId: 1)
class AdoptionModel {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final int? age;

  @HiveField(2)
  final String? gender;

  @HiveField(3)
  final String? noOfPets;

  AdoptionModel({
    required this.name,
    required this.age,
    required this.gender,
    required this.noOfPets,
  });
}
