import 'dart:async';

import 'package:autonomous_chef/app/core/ingredient/domain/entities/enum.dart';
import 'package:autonomous_chef/app/core/ingredient/domain/entities/ingredient_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:autonomous_chef/app/modules/ingredient/ingredient_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class IngredientPage extends StatefulWidget {
  final String title;
  const IngredientPage({Key? key, this.title = 'IngredientPage'})
      : super(key: key);
  @override
  IngredientPageState createState() => IngredientPageState();
}

//TODO É errado extender da classe modularState fora da página home?
class IngredientPageState
    extends ModularState<IngredientPage, IngredientStore> {
  @override
  final IngredientStore store = Modular.get();

  late StreamController _streamController;
  final TextEditingController _ingredientNameController =
      TextEditingController();
  final TextEditingController _ingredientDescriptionController =
      TextEditingController();
  final TextEditingController _ingredientAmountController =
      TextEditingController();
  final TextEditingController _ingredientPriceController =
      TextEditingController();

  var measure = UnitMeasurement.grama;

  @override
  void initState() {
    _streamController = StreamController();
    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: ScopedBuilder<IngredientStore, Exception, int>(
        store: store,
        onState: (_, counter) {
          return StreamBuilder<List<Ingredient>>(
            stream: controller.listIngredient(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var ingredient = snapshot.data![index];
                  return ListTile(
                    title: Text(ingredient.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Description: ${ingredient.description}"),
                        Text("Amount: ${ingredient.amount.toString()}"),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        onError: (context, error) => const Center(
          child: Text(
            'Too many clicks',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Registrar ingrediente"),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9),
                      child: TextFormField(
                        controller: _ingredientNameController,
                        decoration: const InputDecoration(
                          label: Text("Ingrediente"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        controller: _ingredientDescriptionController,
                        decoration: const InputDecoration(
                          label: Text("Descrição"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _ingredientAmountController,
                        decoration: const InputDecoration(
                          label: Text("Quantidade em estoque"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: DropdownButton<UnitMeasurement>(
                        value: measure,
                        onChanged: (newValue) {
                          setState(() {
                            measure = newValue!;
                          });
                        },
                        items: UnitMeasurement.values.map(
                          (UnitMeasurement measurement) {
                            return DropdownMenuItem<UnitMeasurement>(
                              value: measurement,
                              child: Text(measurement.name),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        controller: _ingredientPriceController,
                        decoration: const InputDecoration(
                          label: Text("Preço"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    store.addIngredient(
                      collectionName: "ingredients",
                      name: _ingredientNameController.text.toString(),
                      description:
                          _ingredientDescriptionController.text.toString(),
                      amount: int.parse(
                          _ingredientAmountController.text.toString()),
                      unitMeasurement: measure.index,
                      price: double.parse(
                          _ingredientPriceController.text.toString()),
                    );
                    _ingredientNameController.text = "";
                    _ingredientDescriptionController.text = "";
                    _ingredientAmountController.text = "";

                    _ingredientPriceController.text = "";
                    Navigator.pop(context);
                  },
                  child: const Text("Salvar"),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
