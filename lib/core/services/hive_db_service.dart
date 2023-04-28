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
    await Hive.deleteFromDisk();
    await Hive.deleteBoxFromDisk('recipes');
    await Hive.deleteBoxFromDisk('groceries');
    Hive.registerAdapter<Grocery>(GroceryAdapter());
    Hive.registerAdapter<Recipe>(RecipeAdapter());
    Hive.registerAdapter<Ingredient>(IngredientAdapter());
    await Hive.openBox<Recipe>('recipes');
    await Hive.openBox<Grocery>('groceries');

    recipeBox = Hive.box<Recipe>('recipes');
    groceryBox = Hive.box<Grocery>('groceries');

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
}
