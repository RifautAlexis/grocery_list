import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_list/core/services/hive_db_service.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../recipe_list/models/recipe.dart';

class CreateRecipeController extends GetxController {
  HiveDbService hiveDB = Get.find();

  final recipeFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final stepsController = TextEditingController();
  final ingredientsController = TextEditingController();
  final tagsController = TextEditingController();

  final recipeForm = FormGroup({
    'name': FormControl<String>(value: 'John Doe'),
    'steps': FormArray<String>([FormControl<String>()]),
    'ingredients': FormArray<Map<String, dynamic>>([
      FormGroup({
        'name': FormControl<String>(),
        'quantity': FormControl<int>(value: 1),
      })
    ]),
    // 'ingredients': FormArray<String>([FormControl<String>()]),
    'tags': FormArray<String>([FormControl<String>()]),
  });

  FormArray<Map<String, dynamic>> get ingredients =>
      recipeForm.control('ingredients') as FormArray<Map<String, dynamic>>;

  Future<void> addRecipe() async {
    Map<String, dynamic> formValues = recipeForm.value;
    print(formValues);
    // if (recipeFormKey.currentState != null &&
    //     recipeFormKey.currentState!.validate()) {
    //   Map<String, dynamic> formValues = recipeForm.value;
    //   await hiveDB.addRecipe(
    //     Recipe(formValues["name"], formValues["steps"],
    //         [Ingredient("Celery", 1)], formValues["tags"]),
    //   );
    //   backToRecipeList();
    // }
  }

  void backToRecipeList() {
    Get.back(closeOverlays: true);
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  void addFormStep() {
    final ingredients = recipeForm.controls["steps"] as FormArray;
    ingredients.add(FormControl<String>());
  }

  void addFormIngredient() {
    // form.control('address.0.city');
    final ingredients = recipeForm.controls["ingredients"] as FormArray;
    popo(ingredients.value!);
    // print(ingredients.value);
    ingredients.add(FormGroup({
      'name': FormControl<String>(),
      'quantity': FormControl<int>(value: 1),
    }));
    // popo(ingredients.value as List<Toto>);
  }

  void popo(List<dynamic> array) {
    for (var element in array) {
      print(element);
    }
  }

  void addFormTag() {
    final ingredients = recipeForm.controls["tags"] as FormArray;
    ingredients.add(FormControl<String>());
  }
}

class Toto {
  final String name;
  final int quantity;

  Toto(this.name, this.quantity);
}
