import 'package:doza_pet/models/models.dart';
import 'package:doza_pet/repositories/repository.dart';

class PetRepository extends Repository<Pet> {
  PetRepository() : super(table: "mascota");

  @override
  Pet fromRequestData(Map<String, dynamic> data) {
    return Pet.fromMap(data);
  }

  @override
  Map<String, dynamic> toRequestData(Pet data) {
    return data.toMap();
  }
}
