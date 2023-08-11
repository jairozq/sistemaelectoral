import 'package:sistemaelectoral/data/services/peticionesMesa.dart';
import 'package:sistemaelectoral/domain/models/mesa.dart';
import 'package:get/get.dart';

class ControlMesa extends GetxController {
  final Rxn<List<Mesa>> _listarMesa = Rxn<List<Mesa>>([]);

  Future<void> consultarMesa(String cedula) async {
    _listarMesa.value = await PeticionesMesa.consultarMesas(cedula);
  }

  Future<void> FiltrarMesa(String sede) async {
    _listarMesa.value = await PeticionesMesa.filtraMesas(sede);
  }

  Future<void> listraMesa() async {
    _listarMesa.value = await PeticionesMesa.listaMesa();
  }

  List<Mesa>? get listaMesa => _listarMesa.value;
}
