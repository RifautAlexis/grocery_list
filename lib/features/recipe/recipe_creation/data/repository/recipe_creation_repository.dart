import 'package:get/get.dart';
import 'package:grocery_list/core/services/hive_db_service.dart';

import '../../models/recipe.dart';
import '../../../recipe_list/models/recipe_overview.dart';

class RecipeCreationRepository {
  final HiveDbService hiveDbService = Get.find();

  List<RecipeOverview> getRecipes() {
    return hiveDbService.recipeBox.values
        .map((e) => RecipeOverview(e.id, e.name))
        .toList();
  }

  Future<void> addRecipe(Recipe newRecipe) async {
    await hiveDbService.recipeBox.add(newRecipe);
  }

  Future<void> addRecipes(List<Recipe> newRecipes) async {
    await hiveDbService.recipeBox.addAll(newRecipes);
  }

  Future<Recipe> getRecipe(int id) async {
    return hiveDbService.recipeBox.values
        .firstWhere((element) => element.id == id);
  }
}
