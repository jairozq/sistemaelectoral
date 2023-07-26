import 'package:sistemaelectoral/data/services/peticionesTestigos.dart';
import 'package:sistemaelectoral/domain/models/testigo.dart';
import 'package:get/get.dart';

class ControlTestigo extends GetxController {
  final Rxn<List<Testigo>> _listarTestigo = Rxn<List<Testigo>>([]);

  Future<void> consultarTestigo(String cedula) async {
    _listarTestigo.value = await PeticionesTestigo.consultarTestigos(cedula);
  }

  List<Testigo>? get listaAccessLogin => _listarTestigo.value;
}
