import 'package:get/get.dart';
import 'package:grocery_list/pages/recipe_list/presentation/view/recipes_list_page.dart';

import '../pages/groceries_overview/bindings/groceries_overview_binding.dart';
import '../pages/groceries_overview/presentation/view/groceries_overview_page.dart';
import '../pages/recipe_list/bindings/recipes_list_binding.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => GroceriesOverviewPage(),
      binding: GroceriesOverviewBinding(),
    ),
    GetPage(
      name: Routes.RECIPES,
      page: () => RecipeListPage(),
      binding: RecipeListBinding(),
    ),
  ];
}
