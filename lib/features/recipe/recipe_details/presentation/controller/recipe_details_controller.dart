import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_list/features/recipe/recipe_creation/models/recipe.dart';
import 'package:grocery_list/features/recipe/recipe_details/data/recipe_details_repository.dart';
import 'package:grocery_list/features/recipe/recipe_details/presentation/widgets/ingredients_details.dart';
import 'package:grocery_list/features/recipe/recipe_details/presentation/widgets/preview_details.dart';
import 'package:grocery_list/features/recipe/recipe_details/presentation/widgets/steps_details.dart';
import '../../../../../routes/app_pages.dart';

class RecipeDetailsController extends GetxController {
  RecipeDetailsController();

  RecipeDetailsRepository repository = Get.find<RecipeDetailsRepository>();

  Map<String, Widget> tabs = {
    'Preview': const PreviewDetails(),
    'Ingredients': const IngredientsDetails(),
    'Steps': const StepsDetails(),
  };

  final recipeDetails$ = Rxn<Recipe>();

  @override
  void onInit() {
    super.onInit();
    var recipeIdParameter = Get.parameters["recipeId"];
    if (recipeIdParameter == null) {
      Get.back();
    }
    var recipeId = int.parse(recipeIdParameter!);
    _fetchData(recipeId);
  }

  void _fetchData(int recipeId) {
    var a = repository.getRecipeDetails(recipeId);
    recipeDetails$.value = a;
  }

  void backToRecipeList() {
    Get.back();
  }

  Future<void> goToEdition(int recipeId) async {
    await Get.toNamed(
      Routes.RECIPE_EDIT,
      parameters: {"recipeId": recipeId.toString()},
    );

    _fetchData(recipeId);
  }
}
