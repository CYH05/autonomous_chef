import 'package:flutter_modular/flutter_modular.dart';
import '../../firestore/services/firebase_firestore_interface.dart';
import '../../firestore/services/firebase_firestore_impl.dart';
import '../home/home_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // TODO devo deixar as intancias na raiz/home pra reutilizar em outros lugares? ou devo instanciar em cada modulo
    Bind.lazySingleton(
      (i) => HomeStore(i.get<IFireBaseFirestore>()),
    ),
    Bind<IFireBaseFirestore>(
        (i) => FirebaseFirestoreImpl(FirebaseFirestore.instance))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
