import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:grocery_list/features/recipe/recipe_details/presentation/controller/recipe_details_controller.dart';

class StepsDetails extends GetView<RecipeDetailsController> {
  const StepsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...controller.recipeDetails.steps
                  .mapIndexed(
                    (index, step) => _buildStep(step, index),
                  )
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep(String step, int index) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: const BoxDecoration(
              color: Color(0xffEEEEEE),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.delete),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      // onDismissed: (direction) => controller.removeStep(index),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        color: index.isEven ? const Color(0xffeeeeee) : null,
        // height: 60.0,
        child: Row(
          children: [
            Text((index + 1).toString()),
            const SizedBox(
              width: 10.0,
            ),
            Text(step),
          ],
        ),
      ),
    );
  }
}
