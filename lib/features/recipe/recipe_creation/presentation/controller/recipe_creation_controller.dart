import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/widgets/ingredients_form.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/widgets/preview_form.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/widgets/steps_form.dart';
import '../../data/repository/recipe_creation_repository.dart';
import '../../models/ingredient.dart';
import '../../models/recipe.dart';

class RecipeCreationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RecipeCreationRepository repository = Get.find();

  Map<String, Widget> tabs = {
    'Preview': const PreviewForm(),
    'Ingredients': const IngredientsForm(),
    'Steps': const StepsForm(),
  };

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
    tabController = TabController(vsync: this, length: 3);
  }

  Future<void> addRecipe(GlobalKey<FormBuilderState> formKey) async {
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

    var newRecipe = Recipe(
      id: UniqueKey().hashCode,
      name: name$.value,
      steps: steps$.value,
      ingredients: ingredients$.value,
      tags: tags$.value,
    );

    await repository.addRecipe(newRecipe);
    backToRecipeList();
  }

  void backToRecipeList() {
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
