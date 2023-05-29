import 'package:doza_pet/models/model.dart';

class Device extends Model {
  final BigInt id;
  final BigInt petId;

  Device({required this.id, required this.petId});

  @override
  Map<String, dynamic> toMap() {
    return {"id": id.toString(), "id_mascota": petId.toString()};
  }

  Device.fromMap(Map<String, dynamic> data)
      : id = BigInt.from(data["id"]),
        petId = BigInt.from(data["id_mascota"]);
}
