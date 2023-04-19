import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grocery_list/pages/create_recipe/models/recipe.dart';
import 'package:grocery_list/pages/recipe_list/models/recipe_overview.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../core/services/hive_db_service.dart';
import '../../../../core/services/local_storage_service.dart';
import '../../../../routes/app_pages.dart';
import '../../../create_recipe/models/ingredient.dart';
import 'recipes_list_state.dart';
import 'dart:convert';
import 'dart:io';

class RecipeListController extends StateController<RecipeListState> {
  RecipeListController();

  HiveDbService hiveDB = Get.find<HiveDbService>();
  TextEditingController importerInputController = TextEditingController();

  @override
  onReady() {
    print("READY LIST");
    super.onReady();
    fetchData();
  }

  @override
  onClose() {
    print("CLOSE LIST");
    super.onClose();
  }

  @override
  onStart() {
    print("START LIST");
    super.onStart();
  }

  @override
  onDelete() {
    print("DELETE LIST");
    super.onDelete();
  }

  @override
  void onInit() {
    print("INIT LIST");
    super.onInit();
    hiveDB.init();
    hiveDB.addRecipe(
      Recipe(
        id: UniqueKey().hashCode,
        name: "Recipe01",
        steps: [
          "Cut ingredients",
          "Add what you just cut",
          "Cook them",
        ],
        ingredients: [
          Ingredient(name: "Celery", quantity: 5),
          Ingredient(name: "Beef", quantity: 2),
          Ingredient(name: "Ketchup", quantity: 1),
        ],
        tags: ["meat", "vegetables", "under 15 mins"],
      ),
    );
    hiveDB.addRecipe(
      Recipe(
        id: UniqueKey().hashCode,
        name: "Recipe02",
        steps: [
          "Cook",
        ],
        ingredients: [
          Ingredient(name: "Potato", quantity: 10),
          Ingredient(name: "Chiken", quantity: 3),
          Ingredient(name: "Milk", quantity: 1),
          Ingredient(name: "Bread", quantity: 1),
        ],
        tags: ["meat", "under 30 mins"],
      ),
    );
    hiveDB.addRecipe(
      Recipe(
        id: UniqueKey().hashCode,
        name: "Recipe03",
        steps: [
          "Cut ingredients",
          "Add what you just cut",
          "Cook them",
          "Serve in plates",
          "Make a wish",
        ],
        ingredients: [
          Ingredient(name: "Celery", quantity: 5),
          Ingredient(name: "Salad", quantity: 2),
          Ingredient(name: "Tomato", quantity: 1)
        ],
        tags: ["Vegan", "vegetables"],
      ),
    );
    // fetch data
    fetchData();
  }

  Future<void> addRecipe() async {
    await Get.toNamed(Routes.ADD_RECIPES);
    var recipesOverview = hiveDB.getRecipes();
    var newState = GetStatus<RecipeListState>.success(
      RecipeListState(recipesOverview),
    );
    change(newState);
    refresh();
  }

  void fetchData() {
    var recipes = hiveDB.getRecipes();
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

  Future<void> shareRecipe(String recipeName) async {
    List<Recipe> recipesToCopy = [await hiveDB.getRecipe(recipeName)];
    var plainText = json.encode(recipesToCopy);

    var enCodedJson = utf8.encode(plainText);
    var gZipJson = gzip.encode(enCodedJson);
    var base64Json = base64.encode(gZipJson);

    print(base64Json);
    importRecipe(base64Json);

    // Clipboard.setData(ClipboardData(text: base64Json));
    // await Share.share(
    //   json.encode(base64Json),
    //   sharePositionOrigin: const Rect.fromLTRB(0.0, 0.0, 20.0, 100.0),
    //   // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    // );
  }

  Future<void> importRecipe(String base64Json) async {
    try {
      var decodeBase64Json = base64.decode(base64Json);
      var decodegZipJson = gzip.decode(decodeBase64Json);
      var originalJson = utf8.decode(decodegZipJson);

      print(originalJson);

      List<dynamic> decoded = json.decode(originalJson);
      // print(decoded);
      List<Recipe> newRecipes = List<Recipe>.from(
        decoded.map((x) => Recipe.fromJson(x)),
      );

      hiveDB.addRecipes(newRecipes);
      fetchData();
    } catch (e) {
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
            TextFormField(
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
}
