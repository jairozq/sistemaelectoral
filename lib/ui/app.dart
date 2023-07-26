import 'package:flutter/material.dart';
import 'content/add_testigo.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/agregarTestigos',
      routes: {
        "/agregarTestigos": (context) => const AddTestigo(),
      },
    );
  }
}
