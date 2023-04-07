import 'package:doza_pet/models/model.dart';

class User extends Model {
  final String username;
  final String password;

  User(this.username, this.password);

  @override
  bool operator ==(covariant User other) {
    return other.username == username;
  }

  @override
  int get hashCode => username.hashCode;

  User.fromMap(Map<String, dynamic> data)
      : username = data["username"],
        password = data["password"];

  @override
  Map<String, dynamic> toMap() {
    return {"username": username, "password": password};
  }
}
