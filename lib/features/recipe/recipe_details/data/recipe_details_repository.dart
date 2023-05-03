import 'package:get/get.dart';
import 'package:grocery_list/features/recipe/recipe_creation/models/recipe.dart';

import '../../../../core/services/hive_db_service.dart';

class RecipeDetailsRepository {
  final HiveDbService hiveDB = Get.find();

  Recipe getRecipeDetails(int id) {
    return hiveDB.recipeBox.values.singleWhere((element) => element.id == id);
  }
}
