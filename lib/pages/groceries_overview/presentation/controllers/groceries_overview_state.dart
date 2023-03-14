import '../../models/grocery_overview.dart';

enum GroceriesOverviewStatus { initial, loading, success, failure }

class GroceriesOverviewState {
  GroceriesOverviewState(this.groceries);

  List<GroceryOverview> groceries;
}

class BaseState<Status> {
  BaseState(this.status);

  Status status;
}
