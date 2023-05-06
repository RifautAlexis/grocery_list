import 'package:get/get.dart';
import 'package:grocery_list/core/services/hive_db_service.dart';
import 'package:grocery_list/features/recipe/recipe_creation/models/recipe.dart';

class RecipeEditRepository {
  final HiveDbService hiveDbService = Get.find();

  Recipe getRecipeDetails(int id) {
    return hiveDbService.recipeBox.values
        .singleWhere((element) => element.id == id);
  }

  void update(int key, Recipe item) async {
    await hiveDbService.recipeBox.put(key, item);
  }
}
