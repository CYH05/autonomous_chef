import 'package:autonomous_chef/app/core/ingredient/domain/entities/ingredient_model.dart';
import 'package:autonomous_chef/app/firestore/model/firestore_document_model.dart';
import 'package:autonomous_chef/app/firestore/services/firebase_firestore_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreImpl implements IFireBaseFirestore {
  late final FirebaseFirestore _firestore;

  FirebaseFirestoreImpl(this._firestore);

  @override
  Stream<List<Ingredient>> getCollection(
      {String collectionName = "ingredients"}) {
    Stream<List<Ingredient>> collectionList;

    collectionList = _firestore.collection(collectionName).snapshots().map(
      (query) {
        return query.docs.map(
          (doc) {
            return Ingredient.fromDocument(doc);
          },
        ).toList();
      },
    );
    return collectionList;
  }

  @override
  Future<void> insertInCollection({
    required String collectionName,
    required objectToInsert,
  }) async {
    Map<String, dynamic> objectMap = objectToInsert.toJson();
    _firestore.collection(collectionName).add(objectMap);
  }

  @override
  Future<void> updateDocument({
    required String collectionName,
    required FirestoreDocument objectToUpdate,
    required Map<String, dynamic> newData,
  }) async {
    _firestore
        .collection(collectionName)
        .doc(objectToUpdate.documentReference)
        .update(newData);
  }
}
