class User {
  String name;
  String email;
  String password;

  User({required this.name, required this.email, required this.password});

  Map<String, String> toMap() {
    return {'name': name, 'email': email, 'password': password};
  }

  factory User.fromMap(Map<String, String> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }
}
