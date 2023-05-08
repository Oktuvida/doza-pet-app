import 'package:doza_pet/models/model.dart';

class Pet extends Model {
  final BigInt id;
  final BigInt userId;
  final String name;
  final double weight;
  final String race;
  final int age;
  final String foodBrand;

  Pet(
      {required this.id,
      required this.userId,
      required this.name,
      required this.weight,
      required this.race,
      required this.age,
      required this.foodBrand});

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id.toString(),
      "id_usuario": userId.toString(),
      "nombre": name,
      "peso": weight,
      "raza": race,
      "edad": age,
      "marca_alimento": foodBrand
    };
  }

  Pet.fromMap(Map<String, dynamic> data)
      : id = BigInt.parse(data["id"]),
        userId = BigInt.parse(data["id_usuario"]),
        name = data["nombre"],
        weight = data["peso"],
        race = data["raza"],
        age = data["edad"],
        foodBrand = data["marca_alimento"];
}
