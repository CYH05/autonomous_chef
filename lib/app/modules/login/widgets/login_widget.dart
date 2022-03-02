import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../login_store.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends ModularState<LoginWidget, LoginStore>
    with TickerProviderStateMixin {
  @override
  void initState() {
    errorMessageController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  final LoginStore store = Modular.get();
  late final AnimationController errorMessageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 250,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: [
              AnimatedBuilder(
                  animation: errorMessageController,
                  builder: (context, _) {
                    return Column(
                      children: [
                        TextField(
                          controller: store.emailTextController,
                          decoration: const InputDecoration(
                            label: Text("email"),
                          ),
                        ),
                        TextField(
                          controller: store.passwordTextController,
                          decoration: const InputDecoration(
                            label: Text("senha"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            store.errorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Modular.to.pushNamed("/register/");
                    },
                    child: const Text("Se cadastrar"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var authentication = await store.login();

                      store.validateLogin(authentication, Modular);
                      setState(() {});
                    },
                    child: const Text("Acessar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
