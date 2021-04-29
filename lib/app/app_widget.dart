import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modular',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      builder: asuka.builder,
    ).modular();
  }
}
