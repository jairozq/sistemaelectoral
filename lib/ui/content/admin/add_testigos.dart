import 'package:flutter/material.dart';

class AddTestigos extends StatefulWidget {
  const AddTestigos({super.key});

  @override
  State<AddTestigos> createState() => _AddTestigosState();
}

class _AddTestigosState extends State<AddTestigos> {
  @override
  Widget build(BuildContext context) {
    TextEditingController user = TextEditingController();
    TextEditingController contrasena = TextEditingController();
    TextEditingController cedula = TextEditingController();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text("Hola"),
      ),
    );
  }
}
