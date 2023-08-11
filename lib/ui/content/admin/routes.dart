import 'package:sistemaelectoral/ui/content/admin/add_registros.dart';
import 'package:sistemaelectoral/ui/content/admin/list_e14.dart';
import 'package:sistemaelectoral/ui/content/admin/list_sedes.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const ListSedes(),
      const ListE14(),
      const AddResgitros(),
    ];
    return myList[index];
  }
}
