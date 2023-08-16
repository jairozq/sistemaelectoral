class Sede {
  late String nombre;
  late String direccion;
  late String mesas;
  late String estadomesas;

  Sede({
    required this.nombre,
    required this.direccion,
    required this.mesas,
    required this.estadomesas,
  });

  factory Sede.desdeJson(Map<String, dynamic> jsonMap) {
    return Sede(
      nombre: jsonMap['nombre'],
      direccion: jsonMap['direccion'],
      mesas: jsonMap['mesas'],
      estadomesas: jsonMap['estadomesas'],
    );
  }
}
