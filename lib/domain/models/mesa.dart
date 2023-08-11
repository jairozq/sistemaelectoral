class Mesa {
  late String sede;
  late String numero;

  Mesa({
    required this.sede,
    required this.numero,
  });

  factory Mesa.desdeJson(Map<String, dynamic> jsonMap) {
    return Mesa(
      sede: jsonMap['sede'],
      numero: jsonMap['numero'],
    );
  }
}
