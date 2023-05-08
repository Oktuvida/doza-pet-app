import 'package:doza_pet/models/model.dart';

class Portion extends Model {
  final BigInt deviceId;
  final double foodToDispense;
  final BigInt dispensingTime;

  Portion(this.deviceId, this.foodToDispense, this.dispensingTime);
  @override
  Map<String, dynamic> toMap() {
    return {
      "id_dispositivo": deviceId.toString(),
      "comida_a_dispensar": foodToDispense,
      "tiempo_dispensacion": dispensingTime.toString()
    };
  }

  Portion.fromMap(Map<String, dynamic> data)
      : deviceId = BigInt.parse(data["id_dispositivo"]),
        foodToDispense = data["comida_a_dispensar"],
        dispensingTime = BigInt.parse(data["tiempo_dispensacion"]);
}
