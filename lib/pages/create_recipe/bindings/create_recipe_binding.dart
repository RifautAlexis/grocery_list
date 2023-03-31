import 'package:get/get.dart';
import '../presentation/controller/create_recipe_controller.dart';

class CreateRecipeBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => CreateRecipeController()),
    ];
  }
}
