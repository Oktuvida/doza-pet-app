import 'package:doza_pet/models/portion.dart';
import 'package:doza_pet/repositories/repository.dart';

class PortionRepository extends Repository<Portion> {
  PortionRepository()
      : super(table: "portion", primaryTableKey: "id_dispositivo");

  @override
  Portion fromRequestData(Map<String, dynamic> data) {
    return Portion.fromMap(data);
  }

  @override
  Map<String, dynamic> toRequestData(Portion data) {
    return data.toMap();
  }
}
