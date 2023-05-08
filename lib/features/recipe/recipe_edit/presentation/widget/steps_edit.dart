import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:grocery_list/features/recipe/recipe_edit/presentation/controller/recipe_edit_controller.dart';

class StepsEdit extends GetView<RecipeEditController> {
  const StepsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          TextFormField(
            controller: controller.stepEditingController,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.send,
            maxLines: 2,
            decoration: const InputDecoration(
              hintText: "Enter a step",
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.redAccent),
              ),
            ),
            onFieldSubmitted: (value) => controller.submitStep(value),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            validator: (value) => controller.stepValidator(),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Expanded(
            child: ReorderableListView(
              shrinkWrap: true,
              onReorder: (oldIndex, newIndex) =>
                  controller.reorderSteps(oldIndex, newIndex),
              children: [
                ...controller.steps$.mapIndexed(
                  (index, element) =>
                      _buildStep(controller.steps$.value[index], index),
                ),
              ],
            ),
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
      onDismissed: (direction) => controller.removeStep(index),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        color: index.isEven ? const Color(0xffeeeeee) : null,
        height: 60.0,
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
