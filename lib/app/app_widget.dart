import 'package:autonomous_chef/app/global_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalStore _store = Modular.get();

    if (_store.isLogged) {
      return MaterialApp(
        title: 'Flutter Slidy',
        initialRoute: "/home/",
        theme: ThemeData(primarySwatch: Colors.blue),
      ).modular();
    }

    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(primarySwatch: Colors.blue),
    ).modular();
  }
}
