class Testigo {
  late String user;
  late String contrasena;
  late String cedula;
  late String tipocuenta;
  late String sede;
  late String estado;

  Testigo({
    required this.user,
    required this.contrasena,
    required this.cedula,
    required this.tipocuenta,
    required this.sede,
    required this.estado,
  });

  factory Testigo.desdeJson(Map<String, dynamic> jsonMap) {
    return Testigo(
      user: jsonMap['user'],
      contrasena: jsonMap['contrasena'],
      cedula: jsonMap['cedula'],
      tipocuenta: jsonMap['tipocuenta'],
      sede: jsonMap['sede'],
      estado: jsonMap['estado'],
    );
  }
}
