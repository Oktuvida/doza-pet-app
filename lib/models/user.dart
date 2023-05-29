import 'package:doza_pet/models/model.dart';

class User extends Model {
  final String email;
  final BigInt phone;

  User(this.email, this.phone);

  User.fromMap(Map<String, dynamic> data)
      : email = data["email"],
        phone = BigInt.from(data["celular"]);

  @override
  Map<String, dynamic> toMap() {
    return {"email": email, "celular": phone.toString()};
  }
}
