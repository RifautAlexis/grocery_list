import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:grocery_list/features/recipe/recipe_creation/models/ingredient.dart';
import 'package:grocery_list/features/recipe/recipe_details/presentation/controller/recipe_details_controller.dart';

class IngredientsDetails extends GetView<RecipeDetailsController> {
  const IngredientsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...controller.recipeDetails.ingredients
                  .mapIndexed(
                    (index, ingredient) => _buildIngredient(ingredient, index),
                  )
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIngredient(Ingredient item, int index) {
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
      // onDismissed: (direction) => controller.removeIngredient(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        color: index.isEven ? const Color(0xffeeeeee) : null,
        height: 60.0,
        child: Row(
          children: [
            Text(item.name),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // IconButton(
                  //   onPressed: () => controller.decrementQuantity(index),
                  //   icon: const Icon(Icons.remove_circle),
                  // ),
                  Text(
                    item.quantity.toString(),
                  ),
                  // IconButton(
                  //   onPressed: () => controller.incrementQuantity(index),
                  //   icon: const Icon(Icons.add_circle),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
