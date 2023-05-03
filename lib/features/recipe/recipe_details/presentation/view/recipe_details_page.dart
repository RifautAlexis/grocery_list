import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_list/features/recipe/recipe_details/presentation/controller/recipe_details_controller.dart';
import 'package:grocery_list/features/recipe/widget/recipe_scaffold.dart';
import 'package:grocery_list/shared/Widgets/custom_bottom_navigation_bar/presentation/view/custom_bottom_navigation_bar.dart';

class RecipeDetailsPage extends GetView<RecipeDetailsController> {
  const RecipeDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RecipeScaffoldPage(
      title: Text(controller.recipeDetails.name),
      leading: IconButton(
        onPressed: () => controller.backToRecipeList(),
        icon: const Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () => print("GO TO EDITION"), // controller.goToEdition(),
          icon: const Icon(Icons.edit),
        )
      ],
      bottomNavigationBar: const CustomBottomNavigationBar(),
      tabs: controller.tabs,
    );
  }
}
