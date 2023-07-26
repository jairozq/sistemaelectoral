class Testigo {
  late String nombre;
  late String apellido;
  late String cedula;
  late String sede;
  late String mesa;

  Testigo({
    required this.nombre,
    required this.apellido,
    required this.cedula,
    required this.sede,
    required this.mesa,
  });

  factory Testigo.desdeJson(Map<String, dynamic> jsonMap) {
    return Testigo(
      nombre: jsonMap['nombre'],
      apellido: jsonMap['apellido'],
      cedula: jsonMap['cedula'],
      sede: jsonMap['sede'],
      mesa: jsonMap['mesa'],
    );
  }
}
