import 'package:get/get.dart';
import 'package:grocery_list/pages/create_recipe/data/repository/create_recipe_repository.dart';
import 'presentation/controller/create_recipe_controller.dart';

class CreateRecipeBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => CreateRecipeRepository()),
      Bind.lazyPut(() => CreateRecipeController()),
    ];
  }
}
