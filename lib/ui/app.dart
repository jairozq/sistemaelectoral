import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistemaelectoral/ui/content/homepage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/home',
      routes: {
        "/home": (context) => const HomePage(),
      },
    );
  }
}
