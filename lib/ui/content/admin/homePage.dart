import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistemaelectoral/ui/content/admin/bottom_nav.dart';
import 'package:sistemaelectoral/ui/content/admin/list_sedes.dart';
import 'package:sistemaelectoral/ui/content/admin/routes.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      bottomNavigationBar: myBNB,
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