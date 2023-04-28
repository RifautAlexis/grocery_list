import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_list/features/grocery/grocery_list/data/repository/grocery_list_repository.dart';
import 'grocery_list_state.dart';
import '../../models/grocery.dart';

class GroceryListController extends StateController<GroceryListState> {
  GroceryListRepository repository = Get.find();
  final TextEditingController textFieldAddGroceryController =
      TextEditingController();

  @override
  void onInit() {
    super.onInit();

    repository.hiveDB.groceryBox.addAll([
      Grocery(name: "Celery", quantity: 3),
      Grocery(name: "Banana", quantity: 5),
      Grocery(name: "Bread", quantity: 1),
    ]);

    fetchData();
  }

  void afterAddToList(String groceryName) {
    repository.add(Grocery(name: groceryName, quantity: 1));
    fetchData();
    _clearInput();
  }

  void removeGrocery(Grocery item) {
    item.delete();

    fetchData();
  }

  void incrementQuantity(Grocery item) {
    var groceryClone = item.copyWith(quantity: item.quantity + 1);
    repository.update(item.key, groceryClone);

    fetchData();
  }

  void decrementQuantity(Grocery item) {
    if (item.quantity == 1) {
      removeGrocery(item);
      return;
    }

    var groceryClone = item.copyWith(quantity: item.quantity - 1);
    repository.update(item.key, groceryClone);

    fetchData();
  }

  void fetchData() {
    var groceries = repository.getGroceries();

    if (groceries.isEmpty) {
      var newState = GetStatus<GroceryListState>.empty();
      change(newState);
    } else {
      var newState = GetStatus<GroceryListState>.success(
        GroceryListState(groceries),
      );
      change(newState);
    }
  }

  void _clearInput() {
    textFieldAddGroceryController.clear();
  }
}
