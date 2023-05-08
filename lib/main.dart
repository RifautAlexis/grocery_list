import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_list/core/services/hive_db_service.dart';
import 'package:grocery_list/routes/app_pages.dart';

Future<void> main() async {
  await initService();

  runApp(GetMaterialApp(
    title: 'Grocery List',
    theme: ThemeData(
      useMaterial3: true,
    ),
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}

Future<void> initService() async {
  // ignore: avoid_print
  print('Starting services...');
  var hiveDbService = await HiveDbService().init();
  Get.put<HiveDbService>(hiveDbService, permanent: true);
  // ignore: avoid_print
  print('All services started...');
}
