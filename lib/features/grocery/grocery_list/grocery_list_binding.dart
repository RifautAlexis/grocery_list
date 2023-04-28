import 'package:get/get.dart';
import 'package:grocery_list/features/grocery/grocery_list/data/repository/grocery_list_repository.dart';
import 'package:grocery_list/features/grocery/grocery_list/presentation/controllers/grocery_list_controller.dart';

import '../../../shared/Widgets/custom_bottom_navigation_bar/presentation/controllers/custom_bottom_navigation_bar_controller.dart';

class GroceryListBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => GroceryListRepository()),
      Bind.lazyPut(() => CustomBottomNavigationBarController()),
      Bind.lazyPut(() => GroceryListController()),
    ];
  }
}
