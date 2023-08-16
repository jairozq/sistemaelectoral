class Mesa {
  late String sede;
  late String numero;
  late String estadoe14;

  Mesa({
    required this.sede,
    required this.numero,
    required this.estadoe14,
  });

  factory Mesa.desdeJson(Map<String, dynamic> jsonMap) {
    return Mesa(
      sede: jsonMap['sede'],
      numero: jsonMap['numero'],
      estadoe14: jsonMap['estadoe14'],
    );
  }
}
