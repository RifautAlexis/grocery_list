import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_list/features/recipe/recipe_creation/models/ingredient.dart';
import 'package:grocery_list/features/recipe/recipe_creation/models/recipe.dart';
import 'package:grocery_list/features/recipe/recipe_list/models/recipe_overview.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../grocery/grocery_list/models/grocery.dart';
import '../../../../grocery/grocery_list/presentation/controllers/grocery_list_controller.dart';
import '../../data/repository/recipe_list_repository.dart';
import 'recipes_list_state.dart';
import 'dart:convert';
import 'dart:io';

class RecipeListController extends StateController<RecipeListState> {
  RecipeListController();

  RecipeListRepository repository = Get.find<RecipeListRepository>();
  final GroceryListController groceryListController = Get.find();

  TextEditingController importerInputController = TextEditingController();
  TextEditingController searchInputController = TextEditingController();

  RxString searchInput = ''.obs;

  @override
  void onInit() {
    super.onInit();

    searchInputController.addListener(() {
      searchInput.value = searchInputController.text;
    });
    debounce(searchInput, (searchText) => search(searchText),
        time: const Duration(seconds: 1));

    fetchData();
  }

  Future<void> addRecipe() async {
    await Get.toNamed(Routes.ADD_RECIPE);
    var recipesOverview = repository.getRecipes();
    var newState = GetStatus<RecipeListState>.success(
      RecipeListState(recipesOverview),
    );
    change(newState);
    refresh();
  }

  void fetchData() {
    var recipes = repository.getRecipes();
    _refreshData(recipes);
  }

  Future<void> shareRecipe(int id) async {
    List<Recipe> recipesToCopy = [await repository.getRecipe(id)];
    var plainText = json.encode(recipesToCopy);

    var enCodedJson = utf8.encode(plainText);
    var gZipJson = gzip.encode(enCodedJson);
    var base64Json = base64.encode(gZipJson);

    importRecipe(base64Json);
  }

  Future<void> importRecipe(String base64Json) async {
    try {
      var decodeBase64Json = base64.decode(base64Json);
      var decodegZipJson = gzip.decode(decodeBase64Json);
      var originalJson = utf8.decode(decodegZipJson);

      List<dynamic> decoded = json.decode(originalJson);
      List<Recipe> newRecipes = List<Recipe>.from(
        decoded.map((x) => Recipe.fromJson(x)),
      );

      repository.addRecipes(newRecipes);
      fetchData();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void openRecipeImporter() {
    Get.dialog(
      AlertDialog(
        title: const Text("Recipe Importer"),
        contentPadding: const EdgeInsets.all(25.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: importerInputController,
              decoration: const InputDecoration(hintText: "Recipe's name"),
            ),
            const Text(
              "The pasted text is not conform, the import is not possible",
              style: TextStyle(color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () => importRecipe(importerInputController.text),
              child: const Text("Import"),
            ),
          ],
        ),
        buttonPadding: EdgeInsets.zero,
      ),
    );
  }

  Future<void> removeItem(int id) async {
    Recipe recipeToDelete = await repository.getRecipe(id);
    await recipeToDelete.delete();
    fetchData();
  }

  Future<void> addIngredients(int id) async {
    Recipe recipe = await repository.getRecipe(id);
    var groceries = recipe.ingredients.map((ingredient) =>
        Grocery(name: ingredient.name, quantity: ingredient.quantity));
    await repository.addToGroceryList(groceries);
    Get.rawSnackbar(
      message: '${groceries.length} ingredients have been successfully added',
      snackPosition: SnackPosition.top,
      backgroundColor: Colors.green,
    );
    groceryListController.fetchData();
  }

  void search(String searchText) {
    var recipes = repository.search(searchText);
    _refreshData(recipes);
  }

  Future<void> goToDetails(int recipeId) async {
    await Get.toNamed(
      Routes.RECIPE_DETAILS,
      parameters: {"recipeId": recipeId.toString()},
    );

    fetchData();
  }

  void _refreshData(List<RecipeOverview> recipes) {
    if (recipes.isEmpty) {
      var newState = GetStatus<RecipeListState>.empty();
      change(newState);
    } else {
      var newState = GetStatus<RecipeListState>.success(
        RecipeListState(recipes),
      );
      change(newState);
    }
  }
}
