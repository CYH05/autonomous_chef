import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Modular.to.pushNamed("/ingredient/");
            },
            child: const Text("Ingredientes"),
          ),
          ElevatedButton(
            onPressed: () {
              if (store.logout()) {
                Modular.to.navigate('/');
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Erro"),
                        content: Text(store.errorMessage),
                        actions: [
                          ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Ok"))
                        ],
                      );
                    });
              }
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
