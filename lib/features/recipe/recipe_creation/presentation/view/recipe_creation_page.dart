import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/controller/recipe_creation_controller.dart';
import 'package:grocery_list/features/recipe/widget/recipe_scaffold.dart';

class RecipeCreationPage extends GetView<RecipeCreationController> {
  const RecipeCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RecipeScaffoldPage(
      title: const Text('Create a Recipe'),
      leading: IconButton(
        onPressed: () => controller.backToRecipeList(),
        icon: const Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () => controller.addRecipe(controller.formKey),
          icon: const Icon(Icons.save),
        )
      ],
      formKey: controller.formKey,
      tabs: controller.tabs,
    );
  }
}
