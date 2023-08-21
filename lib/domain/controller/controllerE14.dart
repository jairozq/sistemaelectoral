import 'package:sistemaelectoral/data/services/peticionesE14.dart';
import 'package:sistemaelectoral/domain/models/e14.dart';
import 'package:get/get.dart';
import 'package:sistemaelectoral/domain/models/utiles.dart';

class ControlE14 extends GetxController {
  final Rxn<List<E14>> _listarE14 = Rxn<List<E14>>([]);
  final Rxn<List<Mensajes>> _listarmensajes = Rxn<List<Mensajes>>([]);

  Future<void> crearE14(String sede, String mesa, String testigo,
      String? imagen, String votos) async {
    _listarmensajes.value =
        await PeticionesE14.crearE14(sede, mesa, testigo, imagen, votos);
  }

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
  List<Mensajes>? get listamensaje => _listarmensajes.value;
}
