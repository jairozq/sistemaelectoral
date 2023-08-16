import 'package:sistemaelectoral/domain/models/utiles.dart';
import 'package:sistemaelectoral/domain/models/e14.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeticionesE14 {
  static Future<List<Mensajes>> crearE14(
      String sede, String mesa, String testigo, String? imagen) async {
    var url =
        Uri.parse("https://sistemaelectoral.codersdevs.com.co/php/add_e14.php");
    final response = await http
        .post(url, body: {'sede': sede, 'mesa': mesa, 'testigo': testigo});

    return compute(convertirAlistaMesaje, response.body);
  }

  static Future<List<E14>> consultarE14(String search) async {
    var url = Uri.parse(
        "https://sistemaelectoral.codersdevs.com.co/php/filtrar_e14.php");
    final response = await http.post(url, body: {'search': search});

    return compute(convertirAlistaRespuesta, response.body);
  }

  static Future<List<E14>> listaE14() async {
    var url = Uri.parse(
        "https://sistemaelectoral.codersdevs.com.co/php/select_e14.php");
    final response = await http.get(url);

    return compute(convertirAlistaRespuesta, response.body);
  }

  static List<Mensajes> convertirAlistaMesaje(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static List<E14> convertirAlistaRespuesta(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<E14>((json) => E14.desdeJson(json)).toList();
  }
}
