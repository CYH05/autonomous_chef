import 'package:autonomous_chef/app/core/ingredient/domain/entities/ingredient_model.dart';
import 'package:autonomous_chef/app/firestore/model/firestore_document_model.dart';

abstract class IFireBaseFirestore {
  Stream<List<Ingredient>> getCollection({String collectionName});
  Future<void> insertInCollection({
    required String collectionName,
    required FirestoreDocument objectToInsert,
  });
  Future<void> updateDocument({
    required String collectionName,
    required FirestoreDocument objectToUpdate,
    required Map<String, dynamic> newData,
  });
}
