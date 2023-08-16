import 'package:sistemaelectoral/domain/controller/controllerMesa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistemaelectoral/domain/controller/controllerSede.dart';

class AddMesas extends StatefulWidget {
  const AddMesas({super.key});

  @override
  State<AddMesas> createState() => _AddMesasState();
}

class _AddMesasState extends State<AddMesas> {
  ControlSede controls = Get.put(ControlSede());
  ControlMesa controlm = Get.put(ControlMesa());
  TextEditingController numero = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.9,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: numero,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Número dede la mesa',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: FilledButton(
                    onPressed: () {
                      controlm
                          .crearMesa(controls.listaSede![0].mesas,
                              controls.listaSede![0].direccion)
                          .then((value) {
                        Get.snackbar(
                            'Clientes', controlm.listaMensajes![0].mensaje,
                            duration: const Duration(seconds: 3),
                            icon: const Icon(Icons.info),
                            shouldIconPulse: true,
                            backgroundColor:
                                controlm.listaMensajes![0].mensaje ==
                                        'Mesas Registradas'
                                    ? Colors.green
                                    : Colors.red);
                      });
                      controls
                          .listarSedeGeneral()
                          .then((value) => Get.toNamed("/homePage"));
                    },
                    child: Text(
                      "Crear Mesas",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
