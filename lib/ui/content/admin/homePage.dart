import 'package:sistemaelectoral/ui/content/admin/bottom_nav.dart';
import 'package:sistemaelectoral/ui/content/admin/list_sedes.dart';
import 'package:sistemaelectoral/ui/content/admin/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String dato = '';
int index = idex;

class _HomePageState extends State<HomePage> {
  Bnavigator? myBNB;

  cargarDatos() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    dato = pref.getString("idG").toString();
  }

  void eliminarDatos() async {
    SharedPreferences elim = await SharedPreferences.getInstance();
    setState(() {
      elim.remove("idG");
    });
  }

  @override
  void initState() {
    cargarDatos();
    myBNB = Bnavigator(
      currentIndex: (i) {
        setState(() {
          index = i;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      child: Scaffold(
        bottomNavigationBar: myBNB,
        body: Routes(index: index),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Sitema Electoral',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.035)),
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.156,
              child: IconButton(
                onPressed: () {
                  eliminarDatos();
                  Get.toNamed("/login");
                },
                icon: const Icon(Icons.power_settings_new_rounded,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
