import 'package:sistemaelectoral/ui/content/testigo/list_mesas.dart';
import 'package:sistemaelectoral/ui/content/testigo/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    cargarDatos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Routes(index: index),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Sitema Electoral',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'alkbold',
                fontSize: MediaQuery.of(context).size.height * 0.035)),
        /*actions: [ ****eliminar el id****
          Container(
            width: MediaQuery.of(context).size.width * 0.156,
            child: OutlinedButton.icon(
                onPressed: () {
                  Get.toNamed("/home");
                },
                icon: const Icon(Icons.close_rounded, color: Colors.white),
                label: const Text('',
                    style:
                        TextStyle(color: Colors.black, fontFamily: 'alkbold'))),
          )
        ],*/
      ),
    );
  }
}
