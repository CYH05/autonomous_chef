import 'package:flutter_modular/flutter_modular.dart';
import 'package:autonomous_chef/app/modules/register/register_store.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = 'RegisterPage'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends ModularState<RegisterPage, RegisterStore> {
  @override
  final RegisterStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(label: Text("E-mail")),
                  controller: store.email,
                ),
                TextField(
                  decoration: const InputDecoration(label: Text("Senha")),
                  controller: store.password,
                ),
                ElevatedButton(
                    onPressed: () async {
                      var response = await store.register();
                      if (response.containsKey('error')) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Erro"),
                                content: Text(response['error']),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Ok"))
                                ],
                              );
                            });
                      }
                    },
                    child: const Text("Registrar")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
