import '../models/grocery_overview.dart';

enum GroceriesOverviewStatus { initial, loading, success, failure }

class GroceriesOverviewState {
  const GroceriesOverviewState({
    this.status = GroceriesOverviewStatus.initial,
    this.groceries = const [],
  });

  final GroceriesOverviewStatus status;
  final List<GroceryOverview> groceries;

  GroceriesOverviewState copyWith({
    GroceriesOverviewStatus? status,
    List<GroceryOverview>? groceries,
  }) {
    return GroceriesOverviewState(
      status: status ?? this.status,
      groceries: groceries ?? this.groceries,
    );
  }
}
