import 'package:doza_pet/models/models.dart';
import 'package:doza_pet/repositories/repository.dart';

class PortionRepository extends Repository<Portion> {
  PortionRepository() : super(table: "porcion");

  @override
  Portion fromRequestData(Map<String, dynamic> data) {
    return Portion.fromMap(data);
  }

  @override
  Map<String, dynamic> toRequestData(Portion data) {
    return data.toMap();
  }
}
