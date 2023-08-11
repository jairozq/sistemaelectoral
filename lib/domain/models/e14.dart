class E14 {
  late String sede;
  late String mesa;
  late String testigo;
  late String imagen;

  E14({
    required this.sede,
    required this.mesa,
    required this.testigo,
    required this.imagen,
  });

  factory E14.desdeJson(Map<String, dynamic> jsonMap) {
    return E14(
      sede: jsonMap['sede'],
      mesa: jsonMap['mesa'],
      testigo: jsonMap['testigo'],
      imagen: jsonMap['imagen'],
    );
  }
}
