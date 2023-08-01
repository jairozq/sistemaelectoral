import 'package:flutter/material.dart';
import 'package:sistemaelectoral/ui/content/list_sedes.dart';

class ListTestigos extends StatefulWidget {
  const ListTestigos({super.key});

  @override
  State<ListTestigos> createState() => _ListTestigosState();
}

class _ListTestigosState extends State<ListTestigos> {
  void actualizar() {
    setState(() {
      idex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    actualizar();
    return Container(
      alignment: Alignment.center,
      child: const Text("testigos"),
    );
  }
}
