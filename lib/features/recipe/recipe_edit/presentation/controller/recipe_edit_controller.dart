import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:grocery_list/features/recipe/recipe_creation/models/ingredient.dart';
import 'package:grocery_list/features/recipe/recipe_creation/models/recipe.dart';
import 'package:grocery_list/features/recipe/recipe_edit/data/repository/recipe_edit_repository.dart';
import 'package:grocery_list/features/recipe/recipe_edit/presentation/widget/ingredients_edit.dart';
import 'package:grocery_list/features/recipe/recipe_edit/presentation/widget/preview_edit.dart';
import 'package:grocery_list/features/recipe/recipe_edit/presentation/widget/steps_edit.dart';

class RecipeEditController extends GetxController {
  RecipeEditRepository repository = Get.find<RecipeEditRepository>();

  final Map<String, Widget> tabs = {
    "Preview": const PreviewEdit(),
    "Ingredients": const IngredientsEdit(),
    "Steps": const StepsEdit(),
  };

  late Recipe recipeDetails;

  List<String> errors = [];
  late TabController tabController;

  final formKey = GlobalKey<FormBuilderState>();
  final nameEditingController = TextEditingController();
  final stepEditingController = TextEditingController();
  final ingredientEditingController = TextEditingController();
  final tagEditingController = TextEditingController();

  final name$ = ''.obs;
  final steps$ = <String>[].obs;
  final ingredients$ = <Ingredient>[].obs;
  final tags$ = <String>[].obs;

  List<String> get steps => steps$.value;
  List<Ingredient> get ingredients => ingredients$.value;
  List<String> get tags => tags$.value;

  @override
  void onInit() {
    super.onInit();
    var recipeIdParameter = Get.parameters["recipeId"];
    if (recipeIdParameter == null) {
      Get.back();
    }
    var recipeId = int.parse(recipeIdParameter!);
    recipeDetails = repository.getRecipeDetails(recipeId);
    _initEditForm();
  }

  _initEditForm() {
    nameEditingController.text = name$.value = recipeDetails.name;
    tags$.value = recipeDetails.tags;
    steps$.value = recipeDetails.steps;
    ingredients$.value = recipeDetails.ingredients;
  }

  Future<void> updateRecipe(GlobalKey<FormBuilderState> formKey) async {
    if (!formKey.currentState!.validate()) {
      Get.dialog(
        AlertDialog(
          contentPadding: const EdgeInsets.all(25.0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'At least one field is wrong, please fix it',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          buttonPadding: EdgeInsets.zero,
        ),
      );
      return;
    }

    var recipeToUpdate = recipeDetails.copyWith(
      name: name$.value,
      steps: steps$.value,
      ingredients: ingredients$.value,
      tags: tags$.value,
    );

    repository.update(recipeDetails.key, recipeToUpdate);
    backToRecipeDetails();
  }

  void backToRecipeDetails() {
    Get.back();
  }

  void submitName(String newValue) {
    if (newValue.length < 3) {
      return;
    }

    name$.value = newValue;
  }

  void submitStep(String newValue) {
    if (newValue.isEmpty) {
      return;
    }

    steps$.add(newValue);
    stepEditingController.clear();
  }

  void submitIngredient(String newValue) {
    if (ingredients$.value
        .any((element) => element.name == ingredientEditingController.text)) {
      return;
    }

    ingredients$.add(Ingredient(name: newValue, quantity: 1));
    ingredientEditingController.clear();
  }

  void submitTag(String newValue) {
    if (tags$.value.any((element) => element == tagEditingController.text)) {
      return;
    }

    tags$.add(newValue);
    tagEditingController.clear();
  }

  void removeStep(int index) {
    steps$.value.removeAt(index);
    steps$.refresh();
  }

  void removeIngredient(int index) {
    ingredients$.value.removeAt(index);
    ingredients$.refresh();
  }

  void removeTag(int index) {
    tags$.removeAt(index);
  }

  void incrementQuantity(int index) {
    var ingredient = ingredients$.value[index];
    ingredients$.value[index] =
        Ingredient(name: ingredient.name, quantity: ingredient.quantity + 1);

    ingredients$.refresh();
  }

  void decrementQuantity(int index) {
    if (ingredients$.value[index].quantity == 1) {
      removeIngredient(index);
      return;
    }

    var ingredient = ingredients$.value[index];
    ingredients$.value[index] =
        Ingredient(name: ingredient.name, quantity: ingredient.quantity - 1);

    ingredients$.refresh();
  }

  void nameTapeOutside() {
    FocusScope.of(Get.key.currentContext!).unfocus();

    submitName(nameEditingController.text);
  }

  String? nameValidator() {
    if (nameEditingController.text.isEmpty) {
      return 'Please enter a name';
    }

    if (nameEditingController.text.length < 3) {
      return 'Please enter a name of at least three characters';
    }

    return null;
  }

  String? tagValidator() {
    if (tags$.value.isEmpty) {
      return 'Please enter at least a tag';
    }

    if (tags$.value.any((element) => element == tagEditingController.text)) {
      return 'This tag already exist';
    }

    return null;
  }

  String? ingredientValidator() {
    if (ingredients$.value.isEmpty) {
      return 'Please enter an ingredient';
    }

    if (ingredients$.value
        .any((element) => element.name == ingredientEditingController.text)) {
      return 'This ingredient has already been added';
    }

    return null;
  }

  String? stepValidator() {
    if (steps$.value.isEmpty) {
      return 'Please enter a step';
    }

    return null;
  }

  reorderSteps(int oldIndex, int newIndex) {
    var itemToMove = steps$.value[oldIndex];

    steps$.value.removeAt(oldIndex);

    if (steps$.value.length <= newIndex) {
      steps$.value.add(itemToMove);
    } else {
      steps$.value.insert(newIndex, itemToMove);
    }

    steps$.refresh();
  }
}
