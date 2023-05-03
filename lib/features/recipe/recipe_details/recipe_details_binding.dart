import 'package:get/get.dart';
import 'package:grocery_list/features/recipe/recipe_details/data/recipe_details_repository.dart';
import 'package:grocery_list/features/recipe/recipe_details/presentation/controller/recipe_details_controller.dart';

import '../../../shared/Widgets/custom_bottom_navigation_bar/presentation/controllers/custom_bottom_navigation_bar_controller.dart';

class RecipeDetailsBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => RecipeDetailsRepository()),
      Bind.lazyPut(() => CustomBottomNavigationBarController()),
      Bind.lazyPut(() => RecipeDetailsController()),
    ];
  }
}
