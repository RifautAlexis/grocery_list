import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/widgets/ingredients_form.dart';
import 'package:grocery_list/features/recipe/widget/keep_alive_wrapper.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/widgets/preview_form.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/widgets/steps_form.dart';

class RecipeScaffoldPage extends StatefulWidget {
  const RecipeScaffoldPage({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.formKey,
    required this.tabs,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final GlobalKey<FormBuilderState>? formKey;
  final Map<String, Widget> tabs;

  @override
  State<RecipeScaffoldPage> createState() => _RecipeScaffoldPage();
}

class _RecipeScaffoldPage extends State<RecipeScaffoldPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: widget.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: widget.title,
          leading: widget.leading,
          actions: widget.actions,
          bottom: TabBar(
            controller: _tabController,
            tabs: widget.tabs.keys
                .map(
                  (tabName) => Tab(text: tabName),
                )
                .toList(),
          ),
        ),
        bottomNavigationBar: widget.bottomNavigationBar,
        floatingActionButton: widget.floatingActionButton,
        body: _buildBody(widget.formKey),
      ),
    );
  }

  Widget _buildBody(GlobalKey<FormBuilderState>? formKey) {
    if (formKey == null) {
      return TabBarView(
        controller: _tabController,
        children: widget.tabs.values
            .map(
              (subFormWidget) => KeepAliveWrapper(
                subFormWidget,
              ),
            )
            .toList(),
      );
    } else {
      return FormBuilder(
        key: formKey,
        child: TabBarView(
          controller: _tabController,
          children: widget.tabs.values
              .map(
                (subFormWidget) => KeepAliveWrapper(
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: subFormWidget,
                  ),
                ),
              )
              .toList(),
        ),
      );
    }
  }
}
