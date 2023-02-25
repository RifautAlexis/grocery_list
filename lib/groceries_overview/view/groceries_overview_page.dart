import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_list/groceries_overview/bloc/groceries_overview_bloc.dart';

import '../bloc/groceries_overview_event.dart';
import '../data/repository/groceries_overview_repository.dart';
import 'groceries_overview_list.dart';

class GroceriesOverviewPage extends StatelessWidget {
  const GroceriesOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GroceriesOverviewBloc>(
      create: (_) => GroceriesOverviewBloc(
        groceriesOverviewRepository:
            context.read<GroceriesOverviewRepository>(),
      )..add(const GroceriesOverviewFetched()),
      child: const GroceriesOverviewList(),
    );
  }
}
