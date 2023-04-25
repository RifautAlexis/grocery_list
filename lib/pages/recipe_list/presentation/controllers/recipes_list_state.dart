import '../../models/recipe_overview.dart';

enum GroceryListStatus { initial, loading, success, failure }

class RecipeListState {
  RecipeListState(this.recipes);

  List<RecipeOverview> recipes;
}
