import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageService extends GetxService {
  final String groceryListContainer = 'GroceryListStorage';
  final String groceryListKey = 'GroceryListKey';
  late GetStorage localStorage;

  LocalStorageService() {
    localStorage = GetStorage(groceryListContainer);
  }

  void init() async {
    localStorage.writeIfNull(groceryListKey, '');
  }

  void updateValue(String groceryListJson) {
    localStorage.write(groceryListKey, groceryListJson);
  }

  String readGroceryList() {
    return localStorage.read(groceryListKey);
  }
}
