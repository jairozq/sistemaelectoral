import 'package:sistemaelectoral/data/services/peticionesMesa.dart';
import 'package:sistemaelectoral/domain/models/mesa.dart';
import 'package:get/get.dart';
import 'package:sistemaelectoral/domain/models/utiles.dart';

class ControlMesa extends GetxController {
  final Rxn<List<Mesa>> _listarMesa = Rxn<List<Mesa>>([]);
  final Rxn<List<Mensajes>> _mensajes = Rxn<List<Mensajes>>([]);

  Future<void> crearMesa(String mesas, String sede) async {
    for (int i = 1; i <= int.parse(mesas); i++) {
      _mensajes.value = await PeticionesMesa.crearMesas(i.toString(), sede);
    }
  }

  Future<void> consultarMesa(String cedula) async {
    _listarMesa.value = await PeticionesMesa.consultarMesas(cedula);
  }

  Future<void> consultarMesaGeneral(String search) async {
    _listarMesa.value = await PeticionesMesa.consultarMesasGeneral(search);
  }

  Future<void> FiltrarMesa(String sede) async {
    _listarMesa.value = await PeticionesMesa.filtraMesas(sede);
  }

  Future<void> listraMesa() async {
    _listarMesa.value = await PeticionesMesa.listaMesas();
  }

  Future<void> listraMesaEC() async {
    _listarMesa.value = await PeticionesMesa.listaMesaEC();
  }

  Future<void> listraMesaEP() async {
    _listarMesa.value = await PeticionesMesa.listaMesaEP();
  }

  List<Mesa>? get listaMesa => _listarMesa.value;
  List<Mensajes>? get listaMensajes => _mensajes.value;
}
