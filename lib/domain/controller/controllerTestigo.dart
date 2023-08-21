import 'package:sistemaelectoral/data/services/peticionesTestigos.dart';
import 'package:sistemaelectoral/domain/models/testigo.dart';
import 'package:sistemaelectoral/domain/models/utiles.dart';
import 'package:get/get.dart';

class ControlTestigo extends GetxController {
  final Rxn<List<Testigo>> _listarTestigo = Rxn<List<Testigo>>([]);
  final Rxn<List<Mensajes>> _mensajes = Rxn<List<Mensajes>>([]);

  Future<void> crearTestigo(
      String cedula, String sede, String user, String contrasena) async {
    _mensajes.value =
        await PeticionesTestigo.crearTestigos(cedula, sede, user, contrasena);
  }

  Future<void> listarTestigo() async {
    _listarTestigo.value = await PeticionesTestigo.listarTestigos();
  }

  Future<void> consultarTestigo(String search) async {
    _listarTestigo.value = await PeticionesTestigo.consultarTestigos(search);
  }

  Future<void> modificarEstadoTestigo(String cedula, String estado) async {
    _mensajes.value =
        await PeticionesTestigo.modificarEstadoTestigos(cedula, estado);
  }

  Future<void> validarTestigo(String user, String contrasena) async {
    _listarTestigo.value =
        await PeticionesTestigo.validarTestigos(user, contrasena);
  }

  List<Testigo>? get listaTestigo => _listarTestigo.value;
  List<Mensajes>? get mensaje => _mensajes.value;
}
