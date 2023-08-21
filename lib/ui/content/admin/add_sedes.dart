import 'package:sistemaelectoral/domain/controller/controllerSede.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSedes extends StatefulWidget {
  const AddSedes({super.key});

  @override
  State<AddSedes> createState() => _AddSedesState();
}

class _AddSedesState extends State<AddSedes> {
  ControlSede controls = Get.put(ControlSede());
  TextEditingController nombre = TextEditingController();
  TextEditingController direccion = TextEditingController();
  TextEditingController mesas = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(top: 20, bottom: 45),
                    child: Text(
                      "Ingrese los datos del testigo",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.035),
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: Checkbox.width,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: TextField(
                          controller: nombre,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Nombre del puesto de votacion',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: TextField(
                          controller: direccion,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Direccion',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: mesas,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Número de mesas',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilledButton(
                        onPressed: () {
                          controls
                              .crearSede(
                            nombre.text,
                            direccion.text,
                            mesas.text,
                          )
                              .then((value) {
                            Get.snackbar(
                                'Puestos', controls.listaMensajes![0].mensaje,
                                duration: const Duration(seconds: 3),
                                icon: const Icon(Icons.info),
                                shouldIconPulse: true,
                                backgroundColor:
                                    controls.listaMensajes![0].mensaje ==
                                            'Puesto De Votacion Registrada'
                                        ? Colors.green
                                        : Colors.red);
                          });
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const AddSedes(),
                            ),
                          );
                        },
                        child: Text(
                          '     Registrar     ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.035,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed("/homePageAdmin");
          },
          tooltip: 'Volver',
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
    );
  }
}
