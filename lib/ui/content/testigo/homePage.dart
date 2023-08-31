import 'package:sistemaelectoral/ui/content/testigo/list_mesas.dart';
import 'package:sistemaelectoral/ui/content/testigo/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class HomePageT extends StatefulWidget {
  const HomePageT({super.key});

  @override
  State<HomePageT> createState() => _HomePageTState();
}

String datoC = '';
String datoS = '';
int index = idex;

class _HomePageTState extends State<HomePageT> {
  cargarDatos() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    datoC = pref.getString("idG").toString();
    datoS = pref.getString("sedeG").toString();
  }

  void eliminarDatos() async {
    SharedPreferences elim = await SharedPreferences.getInstance();
    setState(() {
      elim.remove("idG");
      elim.remove("sedeG");
    });
  }

  @override
  void initState() {
    cargarDatos();
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
        body: Routes(index: index),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Sitema Electoral',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'alkbold',
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
            ),
          ],
        ),
      ),
    );
  }
}
