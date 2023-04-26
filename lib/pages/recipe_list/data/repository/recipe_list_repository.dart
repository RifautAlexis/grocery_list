import 'package:get/get.dart';
import 'package:grocery_list/core/services/hive_db_service.dart';
import 'package:grocery_list/pages/grocery_list/models/grocery.dart';

import '../../../create_recipe/models/ingredient.dart';
import '../../../create_recipe/models/recipe.dart';
import '../../models/recipe_overview.dart';

class RecipeListRepository {
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

  List<RecipeOverview> search(String searchText) {
    return hiveDbService.recipeBox.values
        .where((recipe) =>
            recipe.name.contains(searchText) ||
            recipe.tags.any((tag) => tag == searchText))
        .map((e) => RecipeOverview(e.id, e.name))
        .toList();
  }

  Future<void> addToGroceryList(List<Ingredient> ingredients) async {
    var groceries = ingredients.map((ingredient) =>
        Grocery(name: ingredient.name, quantity: ingredient.quantity));
    await hiveDbService.groceryBox.addAll(groceries);
  }
}
