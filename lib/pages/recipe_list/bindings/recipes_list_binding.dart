import 'package:get/get.dart';
import 'package:grocery_list/pages/recipe_list/presentation/controllers/recipes_list_controller.dart';
import '../../../shared/Widgets/custom_bottom_navigation_bar/presentation/controllers/custom_bottom_navigation_bar_controller.dart';
import '../data/repository/recipe_list_repository.dart';

class RecipeListBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => RecipeListRepository()),
      Bind.lazyPut(() => CustomBottomNavigationBarController()),
      Bind.lazyPut(() => RecipeListController()),
    ];
  }
}
