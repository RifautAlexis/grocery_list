import 'package:get/get.dart';
import 'package:grocery_list/core/services/hive_db_service.dart';

import '../../models/recipe.dart';

class RecipeCreationRepository {
  final HiveDbService hiveDbService = Get.find();

  Future<void> addRecipe(Recipe newRecipe) async {
    await hiveDbService.recipeBox.add(newRecipe);
  }
}
