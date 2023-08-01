import 'package:sistemaelectoral/data/services/peticionesUser.dart';
import 'package:sistemaelectoral/domain/models/user.dart';
import 'package:get/get.dart';

class ControlUser extends GetxController {
  final Rxn<List<User>> _listarUser = Rxn<List<User>>([]);

  Future<void> consultarUser(String cedula) async {
    _listarUser.value = await PeticionesUser.consultarAdmin(cedula);
  }

  List<User>? get listaUser => _listarUser.value;
}
