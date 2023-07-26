import 'package:sistemaelectoral/ui/content/add_testigo.dart';
import 'package:sistemaelectoral/ui/content/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistemaelectoral/ui/content/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageH extends StatefulWidget {
  const HomePageH({
    super.key,
  });

  @override
  State<HomePageH> createState() => _HomePageHState();
}

String dato = '';
int index = idex;

class _HomePageHState extends State<HomePageH> {
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
        title: Text('FastHotel',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'alkbold',
                fontSize: MediaQuery.of(context).size.height * 0.035)),
        actions: [
          Container(
            width: MediaQuery.of(context).size.width * 0.156,
            child: OutlinedButton.icon(
                onPressed: () {
                  Get.toNamed("/login");
                },
                icon: const Icon(Icons.close_rounded, color: Colors.white),
                label: const Text('',
                    style:
                        TextStyle(color: Colors.black, fontFamily: 'alkbold'))),
          )
        ],
      ),
    );
  }
}
