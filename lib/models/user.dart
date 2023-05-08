import 'package:doza_pet/models/model.dart';

class User extends Model {
  final String email;
  final BigInt phone;

  User(this.email, this.phone);

  @override
  bool operator ==(covariant User other) {
    return other.email == email;
  }

  @override
  int get hashCode => email.hashCode;

  User.fromMap(Map<String, dynamic> data)
      : email = data["email"],
        phone = data["celular"];

  @override
  Map<String, dynamic> toMap() {
    return {"email": email, "celular": phone};
  }
}
