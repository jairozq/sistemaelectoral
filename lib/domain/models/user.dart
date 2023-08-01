class User {
  late String user;
  late String contrasena;

  User({
    required this.user,
    required this.contrasena,
  });

  factory User.desdeJson(Map<String, dynamic> jsonMap) {
    return User(
      user: jsonMap['user'],
      contrasena: jsonMap['contrasena'],
    );
  }
}
