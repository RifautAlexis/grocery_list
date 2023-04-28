import 'package:get/get.dart';
import 'package:grocery_list/features/recipe/recipe_creation/recipe_creation_binding.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/view/recipe_creation_page.dart';
import 'package:grocery_list/features/recipe/recipe_list/presentation/view/recipes_list_page.dart';
import '../features/grocery/grocery_list/grocery_list_binding.dart';
import '../features/grocery/grocery_list/presentation/view/grocery_list_page.dart';
import '../features/recipe/recipe_list/recipes_list_binding.dart';

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
      page: () => const RecipeCreationPage(),
      binding: RecipeCreationBinding(),
    )
  ];
}
