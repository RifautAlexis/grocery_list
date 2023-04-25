import 'package:get/get.dart';
import 'package:grocery_list/pages/create_recipe/presentation/view/create_recipe_page.dart';
import 'package:grocery_list/pages/recipe_list/presentation/view/recipes_list_page.dart';

import '../pages/create_recipe/bindings/create_recipe_binding.dart';
import '../pages/grocery_list/bindings/grocery_list_binding.dart';
import '../pages/grocery_list/presentation/view/grocery_list_page.dart';
import '../pages/recipe_list/bindings/recipes_list_binding.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => GroceryListPage(),
      binding: GroceryListBinding(),
    ),
    GetPage(
      name: Routes.RECIPES,
      page: () => RecipeListPage(),
      binding: RecipeListBinding(),
    ),
    GetPage(
      name: Routes.ADD_RECIPES,
      page: () => const CreateRecipePage(),
      binding: CreateRecipeBinding(),
    )
  ];
}
