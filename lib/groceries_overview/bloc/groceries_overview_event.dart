abstract class GroceriesOverviewEvent {
  const GroceriesOverviewEvent();
}

class GroceriesOverviewFetched extends GroceriesOverviewEvent {
  const GroceriesOverviewFetched();
}

class GroceriesOverviewItemAdded extends GroceriesOverviewEvent {
  const GroceriesOverviewItemAdded();
}

class GroceriesOverviewItemRemoved extends GroceriesOverviewEvent {
  const GroceriesOverviewItemRemoved();
}
