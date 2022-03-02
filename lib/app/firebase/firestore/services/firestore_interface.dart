import 'package:autonomous_chef/app/core/ingredient/domain/entities/ingredient_model.dart';
import 'package:autonomous_chef/app/firebase/firestore/model/document_model.dart';

abstract class IFirestore {
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
