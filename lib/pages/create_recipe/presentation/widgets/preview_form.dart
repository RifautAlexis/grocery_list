import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import '../controller/create_recipe_controller.dart';

class PreviewForm extends GetView<CreateRecipeController> {
  const PreviewForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.nameEditingController,
              decoration: const InputDecoration(hintText: "Recipe's name"),
              onFieldSubmitted: (value) => controller.submitName(value),
              onTapOutside: (event) => controller.nameTapeOutside(),
              validator: (value) => controller.nameValidator(),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            TextFormField(
              controller: controller.tagEditingController,
              decoration: const InputDecoration(
                hintText: "Enter a tag name",
              ),
              onFieldSubmitted: (value) => controller.submitTag(value),
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              validator: (value) => controller.tagValidator(),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 10.0,
              runSpacing: 5.0,
              direction: Axis.horizontal,
              children: [
                ...controller.tags$
                    .mapIndexed(
                      (index, tag) => Chip(
                        label: Text(tag),
                        deleteIcon: const Icon(Icons.close),
                        onDeleted: () => controller.removeTag(index),
                      ),
                    )
                    .toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
