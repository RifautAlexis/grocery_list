import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/services/local_storage_service.dart';
import '../../../../../pages/groceries_overview/models/grocery_overview.dart';

class InputAddGroceryController extends GetxController {
  final TextEditingController textFieldAddGroceryController =
      TextEditingController();

  final LocalStorageService localStorageService = Get.find();

  @override
  void onInit() {
    super.onInit();
    localStorageService.init();
  }

  void addToList(
    String newGrocery,
  ) {
    var groceryListJson = localStorageService.readGroceryList();

    var jsonDecoded = json.decode(groceryListJson);

    var groceryListFromStorage = List<GroceryOverview>.from(
      jsonDecoded.map(
        (model) => GroceryOverview.fromJson(model),
      ),
    );

    groceryListFromStorage
        .add(GroceryOverview(productName: newGrocery, quantity: 1));

    var newGroceryListJson =
        jsonEncode(groceryListFromStorage.map((e) => e.toJson()).toList());

    localStorageService.updateValue(newGroceryListJson);

    clearInput();
  }

  void clearInput() {
    textFieldAddGroceryController.clear();
  }
}
