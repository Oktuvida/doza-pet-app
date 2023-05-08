import 'package:doza_pet/models/model.dart';

class Device extends Model {
  final BigInt id;
  final BigInt petId;

  Device({required this.id, required this.petId});

  @override
  Map<String, dynamic> toMap() {
    return {"id": id, "id_mascota": petId};
  }

  Device.fromMap(Map<String, dynamic> data)
      : id = data["id"],
        petId = data["id_mascota"];
}
