import 'package:doza_pet/models/models.dart';
import 'package:doza_pet/repositories/repository.dart';

class UserRepository extends Repository<User> {
  UserRepository() : super(table: "usuario");

  @override
  User fromRequestData(Map<String, dynamic> data) {
    return User.fromMap(data);
  }

  @override
  Map<String, dynamic> toRequestData(User data) {
    return data.toMap();
  }
}
