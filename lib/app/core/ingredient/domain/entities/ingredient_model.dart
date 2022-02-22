import 'package:autonomous_chef/app/firestore/model/firestore_document_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ingredient implements FirestoreDocument {
  final String name;
  final String description;
  final int amount;
  final int unitMeasurement;
  final double price;

  @override
  String documentReference;

  Ingredient({
    required this.name,
    required this.description,
    required this.amount,
    required this.unitMeasurement,
    required this.price,
    this.documentReference = "",
  });

  factory Ingredient.fromDocument(QueryDocumentSnapshot document) {
    return Ingredient(
      name: document['name'],
      description: document['description'],
      amount: document['amount'],
      unitMeasurement: document['unitMeasurement'],
      price: document['price'],
      documentReference: document.id,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "amount": amount,
      "unitMeasurement": unitMeasurement,
      "price": price,
    };
  }
}
