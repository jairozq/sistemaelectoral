import 'package:sistemaelectoral/ui/content/add_registros.dart';
import 'package:sistemaelectoral/ui/content/list_testigos.dart';
import 'package:sistemaelectoral/ui/content/list_sedes.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const ListSedes(),
      const ListTestigos(),
      const AddResgitros(),
    ];
    return myList[index];
  }
}
