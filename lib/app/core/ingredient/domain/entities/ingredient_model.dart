import 'package:cloud_firestore/cloud_firestore.dart';

class Ingredient {
  final String name;
  final String description;
  final int amount;
  final int unitMeasurement;
  final double price;

  Ingredient(this.name, this.description, this.amount, this.unitMeasurement,
      this.price);

  factory Ingredient.fromDocument(QueryDocumentSnapshot document) {
    return Ingredient(
      document['name'],
      document['description'],
      document['amount'],
      document['unitMeasurement'],
      document['price'],
    );
  }

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
