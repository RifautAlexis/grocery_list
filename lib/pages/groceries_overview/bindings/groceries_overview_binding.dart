import 'package:get/get.dart';
import 'package:grocery_list/pages/groceries_overview/presentation/controllers/groceries_overview_controller.dart';

import '../data/providers/grocery_api_provider.dart';
import '../data/repository/groceries_overview_repository.dart';

class GroceriesOverviewBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => const GroceryApiProvider()),
      Bind.lazyPut(() => GroceriesOverviewRepository(groceriesApi: Get.find())),
      Bind.lazyPut(() =>
          GroceriesOverviewController(groceriesOverviewRepository: Get.find())),
    ];
  }
}
