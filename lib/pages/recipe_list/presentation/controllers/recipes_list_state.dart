enum GroceriesOverviewStatus { initial, loading, success, failure }

class RecipeListState {
  RecipeListState(this.recipes);

  List<String> recipes;
}
