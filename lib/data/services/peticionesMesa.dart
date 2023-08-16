import 'package:sistemaelectoral/domain/models/utiles.dart';
import 'package:sistemaelectoral/domain/models/mesa.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeticionesMesa {
  static Future<List<Mensajes>> crearMesas(String numero, String sede) async {
    var url = Uri.parse(
        "https://sistemaelectoral.codersdevs.com.co/php/add_mesa.php");
    final response = await http.post(url,
        body: {'numero': numero, 'sede': sede, 'estadoe14': 'PENDIENTE'});

    return compute(convertirAlistaMesaje, response.body);
  }

  static Future<List<Mesa>> filtraMesas(String sede) async {
    var url = Uri.parse(
        "https://sistemaelectoral.codersdevs.com.co/php/filtrar_mesas.php");
    final response = await http.post(url, body: {'sede': sede});

    return compute(convertirAlistaRespuesta, response.body);
  }

  static Future<List<Mesa>> consultarMesas(String cedula) async {
    var url = Uri.parse(
        "https://sistemaelectoral.codersdevs.com.co/php/consultar_mesas.php");
    final response = await http.post(url, body: {'cedula': cedula});

    return compute(convertirAlistaRespuesta, response.body);
  }

  /*static Future<List<Mesa>> listaMesa() async {
    var url = Uri.parse("");
    final response = await http.get(url);

    return compute(convertirAlistaRespuesta, response.body);
  }*/

  static Future<List<Mesa>> listaMesaEC() async {
    var url = Uri.parse(
        "https://sistemaelectoral.codersdevs.com.co/php/filtrar_mesas_estado.php");
    final response = await http.post(url, body: {'estadoe14': 'CREADO'});

    return compute(convertirAlistaRespuesta, response.body);
  }

  static Future<List<Mesa>> listaMesaEP() async {
    var url = Uri.parse(
        "https://sistemaelectoral.codersdevs.com.co/php/filtrar_mesas_estado.php");
    final response = await http.post(url, body: {'estadoe14': 'PENDIENTE'});

    return compute(convertirAlistaRespuesta, response.body);
  }

  static List<Mensajes> convertirAlistaMesaje(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static List<Mesa> convertirAlistaRespuesta(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Mesa>((json) => Mesa.desdeJson(json)).toList();
  }
}
