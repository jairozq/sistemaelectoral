// import 'package:sistemaelectoral/domain/controller/controllerMesa.dart';
// import 'package:sistemaelectoral/domain/controller/controllerTestigo.dart';
import 'package:sistemaelectoral/domain/controller/controllerSede.dart';
import 'package:sistemaelectoral/ui/content/admin/add_testigos.dart';
import 'package:sistemaelectoral/ui/content/admin/list_sedes.dart';
import 'package:sistemaelectoral/ui/content/admin/add_sedes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddResgitros extends StatefulWidget {
  const AddResgitros({super.key});

  @override
  State<AddResgitros> createState() => _AddResgitrosState();
}

class _AddResgitrosState extends State<AddResgitros> {
  void actualizar() {
    setState(() {
      idex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ControlMesa controlm = Get.put(ControlMesa());
    ControlSede controls = Get.put(ControlSede());
    // ControlTestigo controlt = Get.put(ControlTestigo());
    actualizar();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AddSedes(),
                ),
              );
            },
            child: Text(
              "Registrar Sede",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          OutlinedButton(
            onPressed: () {
              controls.listarSedeGeneral().then(
                    (value) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => AddSedes(),
                      ),
                    ),
                  );
            },
            child: Text(
              "Ver Mesas",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          OutlinedButton(
            onPressed: () {
              // cargarDatos();
              // String cedula = '123';
              // controlu.consultarUser(cedula).then(
              //       (value) =>
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AddTestigos(),
                ),
              );
              // );
            },
            child: Text(
              "Registrar Testigo",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
