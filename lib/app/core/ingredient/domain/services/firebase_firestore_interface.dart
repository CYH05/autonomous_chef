import 'package:autonomous_chef/app/core/ingredient/domain/entities/ingredient_model.dart';

abstract class IFireBaseFirestore {
  Stream<List<Ingredient>> getCollection({String collectionName});
  Future<void> insertInCollection({
    required String collectionName,
    required objectToInsert,
  });
}
