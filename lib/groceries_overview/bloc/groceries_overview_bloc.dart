import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_list/groceries_overview/view/groceries_overview_list.dart';

import '../data/repository/groceries_overview_repository.dart';
import '../models/grocery_overview.dart';
import 'groceries_overview_event.dart';
import 'groceries_overview_state.dart';

class GroceriesOverviewBloc
    extends Bloc<GroceriesOverviewEvent, GroceriesOverviewState> {
  GroceriesOverviewBloc(
      {required GroceriesOverviewRepository groceriesOverviewRepository})
      : _groceriesOverviewRepository = groceriesOverviewRepository,
        super(const GroceriesOverviewState()) {
    on<GroceriesOverviewFetched>(_onGroceriesOverviewFetched);
    on<GroceriesOverviewItemAdded>(_onGroceriesOverviewItemAdded);
    on<GroceriesOverviewItemRemoved>(_onGroceriesOverviewItemRemoved);
  }

  final GroceriesOverviewRepository _groceriesOverviewRepository;

  Future<void> _onGroceriesOverviewFetched(
    GroceriesOverviewFetched event,
    Emitter<GroceriesOverviewState> emit,
  ) async {
    try {
      if (state.status == GroceriesOverviewStatus.initial) {
        final groceries =
            await _groceriesOverviewRepository.getGroceriesOverview();
        return emit(
          state.copyWith(
            status: GroceriesOverviewStatus.success,
            groceries: groceries,
          ),
        );
      }
    } catch (_) {
      emit(state.copyWith(status: GroceriesOverviewStatus.failure));
    }
  }

  Future<void> _onGroceriesOverviewItemAdded(
    GroceriesOverviewItemAdded event,
    Emitter<GroceriesOverviewState> emit,
  ) async {
    var groceriesCopy = state.groceries;
    groceriesCopy.add(const GroceryOverview(productName: "Ice Cream"));
    return emit(
      state.copyWith(
        groceries: groceriesCopy,
      ),
    );
  }

  Future<void> _onGroceriesOverviewItemRemoved(
    GroceriesOverviewItemRemoved event,
    Emitter<GroceriesOverviewState> emit,
  ) async {
    return;
  }
}
