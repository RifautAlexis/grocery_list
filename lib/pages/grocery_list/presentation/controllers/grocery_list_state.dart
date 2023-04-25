import '../../models/grocery.dart';

enum GroceryListStatus { initial, loading, success, failure }

class GroceryListState {
  GroceryListState(this.groceries);

  List<Grocery> groceries;
}

class BaseState<Status> {
  BaseState(this.status);

  Status status;
}
