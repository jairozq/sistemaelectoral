import 'package:sistemaelectoral/domain/models/utiles.dart';
import 'package:sistemaelectoral/domain/models/sede.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeticionesSedes {
  static Future<List<Mensajes>> crearSedes(
      String nombre, String direccion, String mesas) async {
    var url = Uri.parse(
        "https://sistemaelectoral.codersdevs.com.co/php/add_sede.php");
    final response = await http.post(url, body: {
      'nombre': nombre,
      'direccion': direccion,
      'mesas': mesas,
      'estadomesas': 'PENDIENTES',
    });

    return compute(convertirAlistaMesaje, response.body);
  }

  static Future<List<Mensajes>> actualizarSedesEstado(String sede) async {
    var url = Uri.parse(
        "https://sistemaelectoral.codersdevs.com.co/php/update_sede.php");
    final response =
        await http.post(url, body: {'sede': sede, 'estadomesas': 'CREADAS'});

    return compute(convertirAlistaMesaje, response.body);
  }

  static Future<List<Sede>> consultarSedes(String direccion) async {
    var url = Uri.parse("");
    final response = await http.post(url, body: {'direccion': direccion});

    return compute(convertirAlistaRespuesta, response.body);
  }

  static Future<List<Sede>> listaSedesGeneral() async {
    var url = Uri.parse(
        "https://sistemaelectoral.codersdevs.com.co/php/select_sedes.php");
    final response = await http.get(url);

    return compute(convertirAlistaRespuesta, response.body);
  }

  static Future<List<Sede>> listaSedes(String sede) async {
    var url = Uri.parse(
        "https://sistemaelectoral.codersdevs.com.co/php/validar_sedes.php");
    final response = await http.post(url, body: {'sede': sede});

    return compute(convertirAlistaRespuesta, response.body);
  }

  static List<Mensajes> convertirAlistaMesaje(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static List<Sede> convertirAlistaRespuesta(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Sede>((json) => Sede.desdeJson(json)).toList();
  }
}
