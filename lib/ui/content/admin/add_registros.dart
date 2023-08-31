import 'package:sistemaelectoral/domain/controller/controllerTestigo.dart';
import 'package:sistemaelectoral/domain/controller/controllerMesa.dart';
// import 'package:sistemaelectoral/domain/controller/controllerSede.dart';
import 'package:sistemaelectoral/ui/content/admin/add_testigos.dart';
import 'package:sistemaelectoral/ui/content/admin/list_mesas.dart';
import 'package:sistemaelectoral/ui/content/admin/list_sedes.dart';
import 'package:sistemaelectoral/ui/content/admin/add_sedes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistemaelectoral/ui/content/admin/list_testigos.dart';

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
    ControlTestigo controlt = Get.put(ControlTestigo());
    ControlMesa controlm = Get.put(ControlMesa());
    // ControlSede controls = Get.put(ControlSede());
    actualizar();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const AddSedes(),
                    ),
                  );
                },
                child: Text(
                  '''Registrar
   Sede''',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const AddTestigos(),
                    ),
                  );
                },
                child: Text(
                  '''Registrar
  Testigo''',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  controlm.listraMesa().then(
                        (value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ListMesas(),
                          ),
                        ),
                      );
                },
                child: Text(
                  '''   Ver
Mesas''',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              OutlinedButton(
                onPressed: () {
                  controlt.listarTestigo().then(
                        (value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ListTestigos(),
                          ),
                        ),
                      );
                },
                child: Text(
                  '''     Ver
Testigos''',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
