import 'package:sistemaelectoral/domain/controller/controllerTestigo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTestigos extends StatefulWidget {
  const AddTestigos({super.key});

  @override
  State<AddTestigos> createState() => _AddTestigosState();
}

class _AddTestigosState extends State<AddTestigos> {
  @override
  Widget build(BuildContext context) {
    TextEditingController cedula = TextEditingController();
    TextEditingController sede = TextEditingController();
    TextEditingController user = TextEditingController();
    TextEditingController contrasena = TextEditingController();
    ControlTestigo controlt = Get.put(ControlTestigo());

    return Container(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 10, bottom: 45),
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
                        keyboardType: TextInputType.number,
                        controller: cedula,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Cedula',
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
                        controller: sede,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Sede',
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
                Wrap(
                    alignment: WrapAlignment.center,
                    spacing: Checkbox.width,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextField(
                            controller: user,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Usuario',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextField(
                            controller: contrasena,
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Contraseña',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )),
                    ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilledButton(
                      onPressed: () {
                        controlt
                            .crearTestigo(cedula.text, sede.text, user.text,
                                contrasena.text)
                            .then((value) {
                          Get.snackbar('Testigo', controlt.mensaje![0].mensaje,
                              duration: const Duration(seconds: 3),
                              icon: const Icon(Icons.info),
                              shouldIconPulse: true,
                              backgroundColor: controlt.mensaje![0].mensaje ==
                                      'Testigo Registrado'
                                  ? Colors.green
                                  : Colors.red);
                        });
                        Get.toNamed("/homePageAdmin");
                      },
                      child: Text(
                        '     Registrar     ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.035,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("/homePageAdmin");
                    },
                    child: const Text(
                      'Volver',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ]),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
