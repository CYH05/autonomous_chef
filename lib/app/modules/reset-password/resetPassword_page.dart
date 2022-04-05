import 'package:flutter_modular/flutter_modular.dart';
import 'package:autonomous_chef/app/modules/reset-password/resetPassword_store.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  final String title;
  const ResetPasswordPage({Key? key, this.title = 'ResetPasswordPage'}) : super(key: key);
  @override
  ResetPasswordPageState createState() => ResetPasswordPageState();
}
class ResetPasswordPageState extends State<ResetPasswordPage> {
  final ResetPasswordStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}