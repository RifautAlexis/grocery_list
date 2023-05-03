import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/controller/recipe_creation_controller.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/widgets/ingredients_form.dart';
import 'package:grocery_list/features/recipe/widget/keep_alive_wrapper.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/widgets/preview_form.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/widgets/steps_form.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addRecipe(controller.formKey),
        child: const Text('Create'),
      ),
      formKey: controller.formKey,
      tabs: controller.tabs,
    );
  }
}
