// ignore_for_file: public_member_api_docs

class User {
  // User Constructor
  ///
  User({
    required this.username,
    required this.age,
    required this.role,
    required this.sex,
  });

  /// Deserialization
  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      age: data['age'] as String,
      username: data['username'] as String,
      sex: data['sex'] as String,
      role: data['username'] as String,
    );
  }

  String? username;
  String? age;
  String? sex;
  String? role;
}
