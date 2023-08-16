import 'package:sistemaelectoral/domain/models/testigo.dart';
import 'package:sistemaelectoral/domain/models/utiles.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeticionesTestigo {
  static Future<List<Mensajes>> crearTestigos(
      cedula, sede, user, contrasena) async {
    var url = Uri.parse(
        "https://sistemaelectoral.codersdevs.com.co/php/add_testigo.php");

    final response = await http.post(url, body: {
      'cedula': cedula,
      'sede': sede,
      'user': user,
      'contrasena': contrasena
    });

    return compute(convertirAlistaMesaje, response.body);
  }

  static Future<List<Testigo>> consultarTestigos(String cedula) async {
    var url = Uri.parse(
        "https://sistemaelectoral.codersdevs.com.co/php/add_testigo.php");
    final response = await http.post(url, body: {'cedula': cedula});

    return compute(convertirAlistaRespuesta, response.body);
  }

  static Future<List<Testigo>> validarTestigos(
      String user, String contrasena) async {
    var url =
        Uri.parse("https://sistemaelectoral.codersdevs.com.co/php/login.php");
    final response =
        await http.post(url, body: {'user': user, 'contrasena': contrasena});

    return compute(convertirAlistaRespuesta, response.body);
  }

  static List<Mensajes> convertirAlistaMesaje(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static List<Testigo> convertirAlistaRespuesta(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Testigo>((json) => Testigo.desdeJson(json)).toList();
  }
}
