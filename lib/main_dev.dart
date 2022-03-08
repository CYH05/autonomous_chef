import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

import 'package:flutter_flavor/flutter_flavor.dart';

void main() {
  FlavorConfig(
    name: "[dev] Autonomous_chef",
    color: Colors.indigo,
    location: BannerLocation.topStart,
  );
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
