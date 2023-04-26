import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/new_path_route.dart';
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

  Future<void> addToGroceryList(Iterable<Grocery> groceries) async {
    var currentGroceryList = hiveDbService.groceryBox.values;
    for (var groceryToAdd in groceries) {
      var identicGrocery = currentGroceryList.firstWhereOrNull((grocery) =>
          grocery.name.toLowerCase() == groceryToAdd.name.toLowerCase());

      if (identicGrocery == null) {
        hiveDbService.groceryBox.add(groceryToAdd);
      } else {
        var groceryClone = identicGrocery.copyWith(
            quantity: identicGrocery.quantity + groceryToAdd.quantity);
        await hiveDbService.groceryBox.put(identicGrocery.key, groceryClone);
      }
    }
  }
}
