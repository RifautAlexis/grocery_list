import 'package:get/get.dart';
import 'package:grocery_list/features/recipe/recipe_creation/data/repository/recipe_creation_repository.dart';
import 'presentation/controller/recipe_creation_controller.dart';

class RecipeCreationBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => RecipeCreationRepository()),
      Bind.lazyPut(() => RecipeCreationController()),
    ];
  }
}
