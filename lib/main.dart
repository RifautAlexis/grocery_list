import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_list/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init('GroceryListStorage');
  initService();
  runApp(GetMaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      useMaterial3: true,
    ),
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}

void initService() async {
  Get.put<LocalStorageService>(LocalStorageService(), permanent: true);
}

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
