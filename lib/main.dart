import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_list/routes/app_pages.dart';
import 'core/services/local_storage_service.dart';

Future<void> main() async {
  await GetStorage.init('GroceryListStorage');

  initService();

  runApp(GetMaterialApp(
    title: 'Grocery List',
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
