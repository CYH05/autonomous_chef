import 'package:autonomous_chef/app/modules/ingredient/ingredient_Page.dart';
import 'package:autonomous_chef/app/firebase/firestore/services/firestore_interface.dart';
import 'package:autonomous_chef/app/firebase/firestore/services/firestore_impl.dart';
import 'package:autonomous_chef/app/modules/ingredient/ingredient_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class IngredientModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => IngredientStore(i.get<IFirestore>()),
    ),
    Bind<IFirestore>((i) => FirebaseFirestoreImpl(FirebaseFirestore.instance))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => const IngredientPage(title: "IngredientPage")),
  ];
}
