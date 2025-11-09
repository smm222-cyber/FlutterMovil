import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';

void main() {
  runApp(const PokeApp());
}

class PokeApp extends StatelessWidget {
  const PokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokéDex Flutter',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}


//para ejecutar en un navggador
//flutter run -d chrome

//para ejecutar en un dispositivo movil conectado
//flutter run

