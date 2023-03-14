import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/local_storage_service.dart';
import 'groceries_overview_state.dart';
import '../../models/grocery_overview.dart';

class GroceriesOverviewController
    extends StateController<GroceriesOverviewState> {
  GroceriesOverviewController();

  final TextEditingController textFieldAddGroceryController =
      TextEditingController();

  final LocalStorageService localStorageService = Get.find();

  int bottomNavigationBarIndex = 0;

  @override
  void onInit() {
    super.onInit();
    localStorageService.init();

    var groceryListJson = localStorageService.readGroceryList();
    if (groceryListJson.isEmpty) {
      var newState = GetStatus<GroceriesOverviewState>.empty();
      change(newState);
    } else {
      var jsonDecoded = json.decode(groceryListJson);
      var groceryListFromStorage = List<GroceryOverview>.from(
        jsonDecoded.map(
          (model) => GroceryOverview.fromJson(model),
        ),
      );
      var newState = GetStatus<GroceriesOverviewState>.success(
        GroceriesOverviewState(groceryListFromStorage),
      );
      change(newState);
    }
  }

  void addToList(
    String newGrocery,
  ) {
    if (status.isEmpty) {
      var newState = GetStatus<GroceriesOverviewState>.success(
        GroceriesOverviewState(
          [
            GroceryOverview(productName: newGrocery, quantity: 1),
          ],
        ),
      );
      change(newState);
    } else {
      state.groceries
          .add(GroceryOverview(productName: newGrocery, quantity: 1));
      refresh();
    }

    textFieldAddGroceryController.clear();

    _updateLocalGrocery();
  }

  void removeItem(
    int index,
  ) {
    state.groceries.removeAt(index);
    refresh();

    _updateLocalGrocery();
  }

  void incrementQuantity(int index) {
    var updatedElement = state.groceries[index]
        .copyWith(quantity: state.groceries[index].quantity + 1);
    state.groceries[index] = updatedElement;
    refresh();

    _updateLocalGrocery();
  }

  void decrementQuantity(int index) {
    if (state.groceries[index].quantity == 1) {
      removeItem(index);
      return;
    }

    var updatedElement = state.groceries[index]
        .copyWith(quantity: state.groceries[index].quantity - 1);
    state.groceries[index] = updatedElement;
    refresh();

    _updateLocalGrocery();
  }

  void navigate(int index) {
    bottomNavigationBarIndex = index;
    Get.toNamed('/recipeList');
  }

  void _updateLocalGrocery() {
    var groceryListJson =
        jsonEncode(state.groceries.map((e) => e.toJson()).toList());

    localStorageService.updateValue(groceryListJson);
  }
}
