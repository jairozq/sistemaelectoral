import 'package:sistemaelectoral/ui/content/testigo/list_mesas.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const ListMesas(),
    ];
    return myList[index];
  }
}
