import 'package:flutter/material.dart';
import 'package:juju30ans/AcceuilPage.dart';
import 'package:juju30ans/DecouvertePage.dart';
import 'package:juju30ans/before22.dart';
import 'package:juju30ans/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        "/before22": (context) => Before22Page(),
        "/acceuil": (context) => AcceuilPage(),
        "/decouverte_yolo_1": (context) => DecouvertePage(),
      },
    );
  }
}
