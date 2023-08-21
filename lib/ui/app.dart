// import 'package:sistemaelectoral/ui/content/admin/list_testigos.dart';
import 'package:sistemaelectoral/ui/content/testigo/homePage.dart';
import 'package:sistemaelectoral/ui/content/admin/homePage.dart';
import 'package:sistemaelectoral/ui/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/login',
      routes: {
        "/login": (context) => const Login(),
        "/homePageAdmin": (context) => const HomePage(),
        "/homePageTestigo": (context) => const HomePageT(),
        // "/pruebba": (context) => const ListTestigos(),
      },
    );
  }
}
