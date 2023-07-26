import 'package:flutter/material.dart';

class AddTestigo extends StatefulWidget {
  const AddTestigo({super.key});

  @override
  State<AddTestigo> createState() => _AddTestigoState();
}

int idex = 0;

class _AddTestigoState extends State<AddTestigo> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nombre = TextEditingController();
    TextEditingController apellido = TextEditingController();
    TextEditingController cedula = TextEditingController();
    TextEditingController sede = TextEditingController();
    TextEditingController mesa = TextEditingController();
    return Container(
      child: Scaffold(
        body: Container(),
      ),
    );
  }
}
