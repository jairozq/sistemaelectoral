import 'package:sistemaelectoral/domain/controller/controllerTestigo.dart';
import 'package:sistemaelectoral/domain/controller/controllerMesa.dart';
import 'package:sistemaelectoral/domain/controller/controllerSede.dart';
import 'package:sistemaelectoral/ui/content/admin/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void guardaDatos(String iduser, String sede) async {
    SharedPreferences dato = await SharedPreferences.getInstance();
    setState(() {
      dato.setString("idG", iduser);
      dato.setString("sedeG", sede);
      index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    ControlTestigo controlt = Get.put(ControlTestigo());
    ControlSede controls = Get.put(ControlSede());
    ControlMesa controlm = Get.put(ControlMesa());
    TextEditingController user = TextEditingController();
    TextEditingController pass = TextEditingController();

    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text("¿Desea salir de la App?"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () => exit(0),
                          icon: const Icon(Icons.check_rounded),
                          label: const Text("Sí"),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close_rounded),
                          label: const Text("No"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          body: Container(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05,
                            bottom: MediaQuery.of(context).size.height * 0.04),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Image.asset(
                          "assets/img/logo.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        child: Text(
                          "Bienvenido",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.04,
                              fontFamily: 'alkbold'),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          children: [
                            TextField(
                              controller: user,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'User',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: pass,
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Contraseña',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            FilledButton(
                              onPressed: () {
                                controlt
                                    .validarTestigo(user.text, pass.text)
                                    .then(
                                  (value) {
                                    if (controlt.listaTestigo!.isEmpty) {
                                      Get.snackbar(
                                          'Usuarios', 'Usuario no Encontrado',
                                          duration: const Duration(seconds: 3),
                                          icon: const Icon(Icons.info),
                                          shouldIconPulse: true,
                                          backgroundColor: Colors.red);
                                    } else {
                                      guardaDatos(
                                          controlt.listaTestigo![0].cedula,
                                          controlt.listaTestigo![0].sede);
                                      if (controlt
                                              .listaTestigo![0].tipocuenta ==
                                          "Admin") {
                                        controls.listarSedeGeneral().then(
                                              (value) =>
                                                  Get.toNamed("/homePageAdmin"),
                                            );
                                      } else {
                                        if (controlt.listaTestigo![0].estado ==
                                            "Activo") {
                                          controlm.FiltrarMesa(controlt
                                                  .listaTestigo![0].sede)
                                              .then(
                                            (value) =>
                                                Get.toNamed("/homePageTestigo"),
                                          );
                                        } else {
                                          Get.snackbar('Usuarios',
                                              'Usuario no se encuentra activo',
                                              duration:
                                                  const Duration(seconds: 3),
                                              icon: const Icon(Icons.info),
                                              shouldIconPulse: true,
                                              backgroundColor: Colors.red);
                                        }
                                      }
                                    }
                                  },
                                );
                              },
                              child: Text(
                                "     Entrar     ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.035,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
