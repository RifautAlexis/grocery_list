import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:grocery_list/features/recipe/recipe_creation/models/ingredient.dart';
import 'package:grocery_list/features/recipe/recipe_creation/models/recipe.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../features/grocery/grocery_list/models/grocery.dart';

class HiveDbService extends GetxService {
  late Box<Recipe> recipeBox;
  late Box<Grocery> groceryBox;

  Future<HiveDbService> init() async {
    await Hive.initFlutter();
    if (kDebugMode) {
      await Hive.deleteFromDisk();
      await Hive.deleteBoxFromDisk('recipes');
      await Hive.deleteBoxFromDisk('groceries');
    }
    Hive.registerAdapter<Grocery>(GroceryAdapter());
    Hive.registerAdapter<Recipe>(RecipeAdapter());
    Hive.registerAdapter<Ingredient>(IngredientAdapter());
    await Hive.openBox<Recipe>('recipes');
    await Hive.openBox<Grocery>('groceries');

    recipeBox = Hive.box<Recipe>('recipes');
    groceryBox = Hive.box<Grocery>('groceries');

    if (kDebugMode) {
      _initDev();
    }

    return this;
  }

  @override
  Future<void> onClose() async {
    super.onClose();
    await groceryBox.compact();
    await groceryBox.close();
    await recipeBox.compact();
    await recipeBox.close();
  }

  void _initDev() {
    groceryBox.addAll([
      Grocery(name: "Celery", quantity: 3),
      Grocery(name: "Banana", quantity: 5),
      Grocery(name: "Bread", quantity: 1),
    ]);

    recipeBox.addAll([
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
    ]);
  }
}
