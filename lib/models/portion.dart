import 'package:doza_pet/models/model.dart';

class Portion extends Model {
  final BigInt deviceId;
  final double foodToDispense;
  final BigInt dispensingTime;

  Portion(this.deviceId, this.foodToDispense, this.dispensingTime);
  @override
  Map<String, dynamic> toMap() {
    return {
      "id_dispositivo": deviceId,
      "comida_a_dispensar": foodToDispense,
      "tiempo_dispensacion": dispensingTime
    };
  }

  Portion.fromMap(Map<String, dynamic> data)
      : deviceId = data["id_dispositivo"],
        foodToDispense = data["comida_a_dispensar"],
        dispensingTime = data["tiempo_dispensacion"];
}
