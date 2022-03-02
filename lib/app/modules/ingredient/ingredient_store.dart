import 'package:autonomous_chef/app/core/ingredient/domain/entities/ingredient_model.dart';
import 'package:autonomous_chef/app/firebase/firestore/model/document_model.dart';
import 'package:autonomous_chef/app/firebase/firestore/services/firestore_interface.dart';
import 'package:flutter_triple/flutter_triple.dart';

class IngredientStore extends NotifierStore<Exception, int> {
  final IFirestore fireStoreRepository;
  IngredientStore(this.fireStoreRepository) : super(0);

  Stream<List<Ingredient>> listIngredient(
      {String collectionName = "ingredients"}) {
    setLoading(true);
    late Stream<List<Ingredient>> returnList;
    try {
      returnList =
          fireStoreRepository.getCollection(collectionName: collectionName);
    } on Exception catch (error) {
      setError(error);
    } finally {
      setLoading(false);
    }
    return returnList;
  }

  Future<void> addIngredient({
    required String collectionName,
    required String name,
    required String description,
    required int amount,
    required int unitMeasurement,
    required double price,
  }) async {
    setLoading(true);
    try {
      Ingredient ingredient = Ingredient(
        name: name,
        description: description,
        amount: amount,
        unitMeasurement: unitMeasurement,
        price: price,
      );
      fireStoreRepository.insertInCollection(
        collectionName: collectionName,
        objectToInsert: ingredient,
      );
    } on Exception catch (error) {
      setError(error);
    } finally {
      setLoading(false);
    }

    setLoading(false);
  }

  Future<void> incrementIngredient({
    required String collectionName,
    required FirestoreDocument objectToUpdate,
    required int amount,
  }) async {
    final incrementData = {"amount": amount};
    fireStoreRepository.updateDocument(
      collectionName: collectionName,
      objectToUpdate: objectToUpdate,
      newData: incrementData,
    );
  }

  Future<void> decrementIngredient({
    required String collectionName,
    required FirestoreDocument objectToUpdate,
    required int amount,
  }) async {
    final incrementData = {"amount": amount};
    fireStoreRepository.updateDocument(
      collectionName: collectionName,
      objectToUpdate: objectToUpdate,
      newData: incrementData,
    );
  }
}
