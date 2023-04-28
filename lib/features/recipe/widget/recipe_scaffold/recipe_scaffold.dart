import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/widgets/ingredients_form.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/widgets/keep_alive_wrapper.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/widgets/preview_form.dart';
import 'package:grocery_list/features/recipe/recipe_creation/presentation/widgets/steps_form.dart';

class RecipeScaffoldPage extends StatefulWidget {
  const RecipeScaffoldPage({
    super.key,
    this.title,
    this.leading,
    this.floatingActionButton,
    this.formKey,
  });

  final Widget? title;
  final Widget? leading;
  final Widget? floatingActionButton;
  final GlobalKey<FormBuilderState>? formKey;

  @override
  State<RecipeScaffoldPage> createState() => _RecipeScaffoldPage();
}

class _RecipeScaffoldPage extends State<RecipeScaffoldPage>
    with SingleTickerProviderStateMixin {
  final Map<String, Widget> _tabs = {
    'Preview': const PreviewForm(),
    'Ingredients': const IngredientsForm(),
    'Steps': const StepsForm(),
  };
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
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
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: widget.title,
          leading: widget.leading,
          bottom: TabBar(
            controller: _tabController,
            tabs: _tabs.keys
                .map(
                  (tabName) => Tab(text: tabName),
                )
                .toList(),
          ),
        ),
        floatingActionButton: widget.floatingActionButton,
        body: _buildBody(widget.formKey),
      ),
    );
  }

  Widget _buildBody(GlobalKey<FormBuilderState>? formKey) {
    if (formKey == null) {
      return TabBarView(
        controller: _tabController,
        children: _tabs.values
            .map(
              (subFormWidget) => KeepAliveWrapper(
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: subFormWidget,
                ),
              ),
            )
            .toList(),
      );
    } else {
      return FormBuilder(
        key: formKey,
        child: TabBarView(
          controller: _tabController,
          children: _tabs.values
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
