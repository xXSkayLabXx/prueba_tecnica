import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/page/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      title: 'Prueba Tecnica',
      initialRoute: 'prueba',
      routes: {
        'prueba': (BuildContext context) => PruebaPage(),
      },
    );
  }
}
