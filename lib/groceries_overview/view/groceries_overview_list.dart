import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_list/groceries_overview/bloc/groceries_overview_state.dart';

import '../bloc/groceries_overview_bloc.dart';
import '../models/grocery_overview.dart';
import 'groceries_overview_item.dart';

// class GroceriesOverviewList extends StatelessWidget {
//   const GroceriesOverviewList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Overview of the Grocery list"),
//       ),
//       body: BlocBuilder<GroceriesOverviewBloc, GroceriesOverviewState>(
//           builder: (context, state) {
//         switch (state.status) {
//           case GroceriesOverviewStatus.initial:
//           case GroceriesOverviewStatus.loading:
//             return const Center(child: CircularProgressIndicator());
//           case GroceriesOverviewStatus.success:
//             return _buildGroceriesOverviewList(state.groceries);
//           case GroceriesOverviewStatus.failure:
//           default:
//             return const Center(
//               child: Text('An error has occur, please refresh'),
//             );
//         }
//       }),
//     );
//   }

//   Widget _buildGroceriesOverviewList(List<GroceryOverview> groceries) {
//     return AnimatedList(
//       initialItemCount: groceries.length,
//       itemBuilder: (context, index, animation) {
//         return GroceriesOverviewItem(
//             item: groceries[index], animation: animation);
//       },
//     );
//   }
// }

class GroceriesOverviewList extends StatefulWidget {
  const GroceriesOverviewList({super.key});

  @override
  State<GroceriesOverviewList> createState() => _GroceriesOverviewListState();
}

class _GroceriesOverviewListState extends State<GroceriesOverviewList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Overview of the Grocery list"),
      ),
      body: BlocBuilder<GroceriesOverviewBloc, GroceriesOverviewState>(
          builder: (context, state) {
        switch (state.status) {
          case GroceriesOverviewStatus.initial:
          case GroceriesOverviewStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case GroceriesOverviewStatus.success:
            return _buildGroceriesOverviewList(state.groceries);
          case GroceriesOverviewStatus.failure:
          default:
            return const Center(
              child: Text('An error has occur, please refresh'),
            );
        }
      }),
    );
  }

  Widget _buildGroceriesOverviewList(List<GroceryOverview> groceries) {
    return AnimatedList(
      initialItemCount: groceries.length,
      itemBuilder: (context, index, animation) {
        return GroceriesOverviewItem(
            item: groceries[index], animation: animation);
      },
    );
  }
}
