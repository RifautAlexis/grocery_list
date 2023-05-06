import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:grocery_list/features/recipe/recipe_edit/presentation/controller/recipe_edit_controller.dart';
import 'package:grocery_list/features/recipe/widget/recipe_scaffold.dart';

class RecipeEditPage extends GetView<RecipeEditController> {
  const RecipeEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RecipeScaffoldPage(
      actions: [
        IconButton(
          onPressed: () => controller.updateRecipe(controller.formKey),
          icon: const Icon(Icons.save),
        ),
      ],
      tabs: controller.tabs,
      formKey: controller.formKey,
    );
  }
}
