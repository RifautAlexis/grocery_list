import 'package:get/get.dart';
import 'package:grocery_list/pages/create_recipe/models/recipe.dart';
import 'package:grocery_list/pages/recipe_list/models/recipe_overview.dart';
import '../../../../core/services/hive_db_service.dart';
import '../../../../core/services/local_storage_service.dart';
import '../../../../routes/app_pages.dart';
import 'recipes_list_state.dart';

class RecipeListController extends StateController<RecipeListState> {
  RecipeListController();

  HiveDbService hiveDB = Get.find<HiveDbService>();

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
}
