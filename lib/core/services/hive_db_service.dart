import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../pages/create_recipe/models/recipe.dart';
import '../../pages/recipe_list/models/recipe_overview.dart';

class HiveDbService extends GetxService {
  HiveDbService() {
    recipeBox = Hive.box('recipes');
  }

  // late LazyBox<Recipe> recipeBox;
  late Box<Recipe> recipeBox;

  Future<void> init() async {
    // recipeBox = await Hive.openLazyBox<Recipe>('recipe');
    // recipeBox = await Hive.openBox<Recipe>('recipes');
  }

  List<RecipeOverview> getRecipes() {
    return recipeBox.values.map((e) => RecipeOverview(e.name)).toList();
  }

  Future<void> addRecipe(Recipe newRecipe) async {
    await recipeBox.add(newRecipe);
  }

  @override
  Future<void> onClose() async {
    super.onClose();
    await recipeBox.compact();
    await recipeBox.close();
  }
}
