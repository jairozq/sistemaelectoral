import 'package:sistemaelectoral/domain/controller/controllerUser.dart';
import 'package:sistemaelectoral/ui/content/add_sedes.dart';
import 'package:sistemaelectoral/ui/content/list_sedes.dart';
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
    // ControlUser controlu = Get.put(ControlUser());
    actualizar();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () {
              // cargarDatos();
              // String cedula = '123';
              // controlu.consultarUser(cedula).then(
              //       (value) =>
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AddSedes(),
                ),
              );
              // );
            },
            child: Text(
              "Registrar Sede",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.05,
                  fontFamily: 'alkbold'),
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
                  builder: (BuildContext context) => AddSedes(),
                ),
              );
              // );
            },
            child: Text(
              "Registrar Mesa",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.05,
                  fontFamily: 'alkbold'),
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
                  builder: (BuildContext context) => AddSedes(),
                ),
              );
              // );
            },
            child: Text(
              "Registrar Testigo",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.05,
                  fontFamily: 'alkbold'),
            ),
          ),
        ],
      ),
    );
  }
}
