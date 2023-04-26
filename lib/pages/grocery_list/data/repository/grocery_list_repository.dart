import 'package:get/get.dart';

import '../../../../core/services/hive_db_service.dart';
import '../../models/grocery.dart';

class GroceryListRepository {
  final HiveDbService hiveDB = Get.find();

  List<Grocery> getGroceries() {
    return hiveDB.groceryBox.values.toList();
  }

  void update(int key, Grocery item) async {
    await hiveDB.groceryBox.put(key, item);
  }

  void add(Grocery item) async {
    await hiveDB.groceryBox.add(item);
  }
}
