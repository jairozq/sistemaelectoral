import 'package:flutter/material.dart';

class ListSedes extends StatefulWidget {
  const ListSedes({super.key});

  @override
  State<ListSedes> createState() => _ListSedesState();
}

int idex = 0;

class _ListSedesState extends State<ListSedes> {
  void actualizar() {
    setState(() {
      idex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    actualizar();
    return Container(
      alignment: Alignment.center,
      child: const Text("Sedes"),
    );
  }
}
