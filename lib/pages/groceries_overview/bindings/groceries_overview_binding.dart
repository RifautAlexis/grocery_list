import 'package:get/get.dart';
import 'package:grocery_list/pages/groceries_overview/presentation/controllers/groceries_overview_controller.dart';

import '../../../shared/Widgets/custom_bottom_navigation_bar/presentation/controllers/custom_bottom_navigation_bar_controller.dart';

class GroceriesOverviewBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => CustomBottomNavigationBarController()),
      Bind.lazyPut(() => GroceriesOverviewController()),
    ];
  }
}
