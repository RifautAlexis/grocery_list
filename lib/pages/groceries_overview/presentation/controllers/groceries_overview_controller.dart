import 'dart:convert';
import 'package:get/get.dart';
import '../../../../core/services/local_storage_service.dart';
import 'groceries_overview_state.dart';
import '../../models/grocery_overview.dart';

class GroceriesOverviewController
    extends StateController<GroceriesOverviewState> {
  GroceriesOverviewController();

  final LocalStorageService localStorageService = Get.find();

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

  void afterAddToList() {
    var groceryListJson = localStorageService.readGroceryList();
    var jsonDecoded = json.decode(groceryListJson);
    var groceryListFromStorage = List<GroceryOverview>.from(
      jsonDecoded.map(
        (model) => GroceryOverview.fromJson(model),
      ),
    );
    if (status.isEmpty) {
      var newState = GetStatus<GroceriesOverviewState>.success(
        GroceriesOverviewState(
          groceryListFromStorage,
        ),
      );
      change(newState);
    } else {
      state.groceries = groceryListFromStorage;

      refresh();
    }
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

  void _updateLocalGrocery() {
    var groceryListJson =
        jsonEncode(state.groceries.map((e) => e.toJson()).toList());

    localStorageService.updateValue(groceryListJson);
  }
}
