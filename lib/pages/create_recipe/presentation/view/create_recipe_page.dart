import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:grocery_list/pages/create_recipe/presentation/controller/create_recipe_controller.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreateRecipePage extends GetView<CreateRecipeController> {
  const CreateRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Recipe'),
        leading: IconButton(
          onPressed: () => controller.backToRecipeList(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addRecipe(),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: ReactiveForm(
            formGroup: controller.recipeForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReactiveTextField(
                  formControlName: 'name',
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    controller.addFormStep();
                  },
                  child: const Text('add steps'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    controller.addFormIngredient();
                  },
                  child: const Text('add ingredients'),
                ),
                ReactiveFormArray(
                  formArrayName: 'steps',
                  builder: (context, array, child) {
                    return Column(
                      children: [
                        for (final control in array.controls)
                          ReactiveTextField<String>(
                            formControl: control as FormControl<String>,
                            decoration:
                                const InputDecoration(labelText: 'Steps'),
                          ),
                      ],
                    );
                  },
                ),
                ReactiveFormArray<Map<String, dynamic>>(
                  // formArray: controller.ingredients,
                  formArrayName: 'ingredients',
                  builder: (context, array, child) {
                    final ingredients = controller.ingredients.controls
                        .map((control) => control as FormGroup)
                        .map((currentform) {
                      return ReactiveForm(
                          formGroup: currentform,
                          child: Column(
                            children: <Widget>[
                              ReactiveTextField(
                                formControlName: 'name',
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                ),
                              ),
                              ReactiveTextField(
                                formControlName: 'quantity',
                                decoration: const InputDecoration(
                                  labelText: 'Quantity',
                                ),
                              ),
                            ],
                          ));
                    });
                    return Wrap(
                      runSpacing: 20,
                      children: ingredients.toList(),
                    );
                  },
                ),
                // ReactiveFormArray(
                //   formArrayName: 'tags',
                //   builder: (context, array, child) {
                //     return Row(
                //       children: [
                //         for (final group in array.controls)
                //           ReactiveTextField<String>(
                //             formControl: group as FormControl<String>,
                //             decoration: const InputDecoration(labelText: 'Tags'),
                //           ),
                //       ],
                //     );
                //   },
                // ),
                ElevatedButton(
                  onPressed: () async {
                    controller.addRecipe();
                  },
                  child: const Text('Create'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
