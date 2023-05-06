import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'ingredient.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Recipe extends HiveObject with _$Recipe {
  Recipe._();

  @HiveType(typeId: 0)
  factory Recipe({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required List<String> steps,
    @HiveField(3) required List<Ingredient> ingredients,
    @HiveField(4) required List<String> tags,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}
