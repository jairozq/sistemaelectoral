import 'package:sistemaelectoral/ui/content/admin/list_sedes.dart';
import 'package:sistemaelectoral/ui/content/admin/homePage.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class Bnavigator extends StatefulWidget {
  final Function currentIndex;
  const Bnavigator({super.key, required this.currentIndex});

  @override
  State<Bnavigator> createState() => _Bnavigator();
}

class _Bnavigator extends State<Bnavigator> {
  //ControlHotel controlh = Get.put(ControlHotel());

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.grey,
        // selectedLabelStyle: const TextStyle(fontFamily: "alksemb"),
        selectedFontSize: MediaQuery.of(context).size.width * 0.04,
        // unselectedLabelStyle: const TextStyle(fontFamily: "alksemb"),
        unselectedFontSize: MediaQuery.of(context).size.width * 0.03,
        currentIndex: idex,
        onTap: (i) {
          setState(() {
            index = i;
            widget.currentIndex(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Puestos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_restaurant_rounded),
            label: "Mesas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_rounded),
            label: "Registros",
          ),
        ]);
  }
}
