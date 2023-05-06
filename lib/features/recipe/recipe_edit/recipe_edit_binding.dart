import 'package:get/get.dart';
import 'package:grocery_list/features/recipe/recipe_edit/data/repository/recipe_edit_repository.dart';
import 'package:grocery_list/features/recipe/recipe_edit/presentation/controller/recipe_edit_controller.dart';

class RecipeEditBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => RecipeEditRepository()),
      Bind.lazyPut(() => RecipeEditController()),
    ];
  }
}
