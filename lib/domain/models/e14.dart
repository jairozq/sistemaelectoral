class E14 {
  late String sede;
  late String mesa;
  late String testigo;
  late String imagen;
  late String votos;

  E14({
    required this.sede,
    required this.mesa,
    required this.testigo,
    required this.imagen,
    required this.votos,
  });

  factory E14.desdeJson(Map<String, dynamic> jsonMap) {
    return E14(
      sede: jsonMap['sede'],
      mesa: jsonMap['mesa'],
      testigo: jsonMap['testigo'],
      imagen: jsonMap['imagen'],
      votos: jsonMap['votos'],
    );
  }
}
