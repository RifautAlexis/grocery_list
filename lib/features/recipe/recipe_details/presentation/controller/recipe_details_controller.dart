import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_list/features/recipe/recipe_creation/models/ingredient.dart';
import 'package:grocery_list/features/recipe/recipe_creation/models/recipe.dart';
import 'package:grocery_list/features/recipe/recipe_details/data/recipe_details_repository.dart';
import 'package:grocery_list/features/recipe/recipe_details/presentation/widgets/ingredients_details.dart';
import 'package:grocery_list/features/recipe/recipe_details/presentation/widgets/preview_details.dart';
import 'package:grocery_list/features/recipe/recipe_details/presentation/widgets/steps_details.dart';
import 'package:grocery_list/features/recipe/recipe_list/models/recipe_overview.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../grocery/grocery_list/models/grocery.dart';
import '../../../../grocery/grocery_list/presentation/controllers/grocery_list_controller.dart';
import 'dart:convert';
import 'dart:io';

class RecipeDetailsController extends GetxController {
  RecipeDetailsController();

  RecipeDetailsRepository repository = Get.find<RecipeDetailsRepository>();

  Map<String, Widget> tabs = {
    'Preview': const PreviewDetails(),
    'Ingredients': const IngredientsDetails(),
    'Steps': const StepsDetails(),
  };

  late Recipe recipeDetails;

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
    recipeDetails = repository.getRecipeDetails(recipeId);
  }

  void backToRecipeList() {
    Get.back(closeOverlays: true);
  }
}
