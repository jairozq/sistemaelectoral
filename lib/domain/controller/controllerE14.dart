import 'package:sistemaelectoral/data/services/peticionesE14.dart';
import 'package:sistemaelectoral/domain/models/e14.dart';
import 'package:get/get.dart';

class ControlE14 extends GetxController {
  final Rxn<List<E14>> _listarE14 = Rxn<List<E14>>([]);

  Future<void> consultarE14(String search) async {
    _listarE14.value = await PeticionesE14.consultarE14(search);
  }

  Future<void> filtrarSede(String sede) async {
    _listarE14.value = await PeticionesE14.consultarE14(sede);
  }

  Future<void> listarE14() async {
    _listarE14.value = await PeticionesE14.listaE14();
  }

  List<E14>? get listaE14 => _listarE14.value;
}
