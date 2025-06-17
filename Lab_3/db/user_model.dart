class UserModelDB {
  int? id;
  String? name;
  String? email;

  UserModelDB({this.id, this.name, this.email});

  factory UserModelDB.fromMap(Map<String, dynamic> map) {
    return UserModelDB(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
