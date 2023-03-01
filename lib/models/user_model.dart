class UserModel {
  final int id;
  final String username;
  final String password;

  UserModel({required this.id, required this.username, required this.password});

  //Unique Id
  @override
  bool operator ==(covariant UserModel other) {
    return other.id == id;
  }

  @override
  int get hashCode => id;
  //Unique Id End

  UserModel.fromMap(Map<String, dynamic> data)
      : id = data["id"],
        username = data["username"],
        password = data["password"];

  Map<String, dynamic> toMap() {
    return {"id": id, "username": username, "password": password};
  }
}
