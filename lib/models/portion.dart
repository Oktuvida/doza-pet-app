import 'package:doza_pet/models/model.dart';
import "package:doza_pet/common/utils/utils.dart";

class Portion extends Model {
  BigInt? id;
  final BigInt deviceId;
  final double foodToDispense;
  final int dispensingTime;

  Portion(this.deviceId, this.foodToDispense, this.dispensingTime);
  @override
  Map<String, dynamic> toMap() {
    return {
      "id_dispositivo": deviceId.toString(),
      "comida_a_dispensar": foodToDispense,
      "tiempo_dispensacion": minutesToTime(dispensingTime)
    };
  }

  Portion.fromMap(Map<String, dynamic> data)
      : id = BigInt.from(data["id"] ?? data["id_porcion"]),
        deviceId = BigInt.from(data["id_dispositivo"]),
        foodToDispense = data["comida_a_dispensar"] + 0.0,
        dispensingTime = timeToMinutes(data["tiempo_dispensacion"]);
}
