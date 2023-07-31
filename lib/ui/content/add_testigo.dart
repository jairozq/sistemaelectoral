import 'package:flutter/material.dart';

class AddTestigo extends StatefulWidget {
  const AddTestigo({super.key});

  @override
  State<AddTestigo> createState() => _AddTestigoState();
}

class _AddTestigoState extends State<AddTestigo> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nombre = TextEditingController();
    TextEditingController apellido = TextEditingController();
    TextEditingController cedula = TextEditingController();
    TextEditingController sede = TextEditingController();
    TextEditingController mesa = TextEditingController();
    return Container(
      alignment: Alignment.center,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: const Text("Hola"),
        ),
      ),
    );
  }
}
