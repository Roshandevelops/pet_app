class PetModel {
  final int? id;
  final String? userName;
  final String? petName;
  final bool? isFriendly;
  final String? petImage;

  PetModel({
    required this.id,
    required this.userName,
    required this.petName,
    required this.isFriendly,
    required this.petImage,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json["id"],
      userName: json["userName"],
      petName: json["petName"],
      isFriendly: json["isFriendly"],
      petImage: json["petImage"],
    );
  }
}
