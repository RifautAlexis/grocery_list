import '../../models/recipe_overview.dart';

enum GroceriesOverviewStatus { initial, loading, success, failure }

class RecipeListState {
  RecipeListState(this.recipes);

  List<RecipeOverview> recipes;
}
