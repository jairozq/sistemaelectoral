import 'package:flutter/material.dart';
import 'package:sistemaelectoral/ui/content/add_testigo.dart';
import 'package:sistemaelectoral/ui/content/list_sedes.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const listSedes(),
      const AddTestigo(),
    ];
    return myList[index];
  }
}
