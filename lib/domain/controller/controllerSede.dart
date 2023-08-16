import 'package:sistemaelectoral/data/services/peticionesSedes.dart';
import 'package:sistemaelectoral/domain/models/sede.dart';
import 'package:get/get.dart';
import 'package:sistemaelectoral/domain/models/utiles.dart';

class ControlSede extends GetxController {
  final Rxn<List<Sede>> _listarSede = Rxn<List<Sede>>([]);
  final Rxn<List<Mensajes>> _mensajes = Rxn<List<Mensajes>>([]);

  Future<void> consultarSede(String direccion) async {
    _listarSede.value = await PeticionesSedes.consultarSedes(direccion);
  }

  Future<void> listarSedeGeneral() async {
    _listarSede.value = await PeticionesSedes.listaSedesGeneral();
  }

  Future<void> actualizarSedeEstado(String sede) async {
    _mensajes.value = await PeticionesSedes.actualizarSedesEstado(sede);
  }

  Future<void> listarSede(String cedula) async {
    _listarSede.value = await PeticionesSedes.listaSedes(cedula);
  }

  List<Sede>? get listaSede => _listarSede.value;
  List<Mensajes>? get listaMensajes => _mensajes.value;
}
