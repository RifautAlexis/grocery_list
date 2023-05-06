import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:grocery_list/features/recipe/recipe_details/presentation/controller/recipe_details_controller.dart';

class PreviewDetails extends GetView<RecipeDetailsController> {
  const PreviewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(controller.recipeDetails$.value!.name),
              const SizedBox(
                height: 25.0,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 10.0,
                runSpacing: 5.0,
                direction: Axis.horizontal,
                children: [
                  ...controller.recipeDetails$.value!.tags
                      .mapIndexed(
                        (index, tag) => Chip(
                          label: Text(tag),
                        ),
                      )
                      .toList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
