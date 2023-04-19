import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'ingredient.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
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

// class RecipeAdapter extends TypeAdapter<Recipe> {
//   @override
//   final typeId = 0;

//   @override
//   Recipe read(BinaryReader reader) {
//     var numOfFields = reader.readByte();
//     var fields = <int, dynamic>{
//       for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Recipe(
//       fields[0] as String,
//       fields[1] as List<String>,
//       fields[2] as List<Ingredient>,
//       fields[3] as List<String>,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, Recipe obj) {
//     writer.write(obj.name);
//     writer.write(obj.name);
//     for (var step in obj.steps) {
//       writer.write(step);
//     }
//     for (var ingredient in obj.ingrdients) {
//       writer.write(ingredient.name);
//       writer.writeInt(ingredient.quantity);
//     }
//     for (var tag in obj.tags) {
//       writer.write(tag);
//     }
//   }
// }

// class IngredientAdapter extends TypeAdapter<Ingredient> {
//   @override
//   final typeId = 1;

//   @override
//   Ingredient read(BinaryReader reader) {
//     var numOfFields = reader.readByte();
//     var fields = <int, dynamic>{
//       for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Ingredient(fields[0] as String, fields[1] as int);
//   }

//   @override
//   void write(BinaryWriter writer, Ingredient obj) {
//     writer.write(obj.name);
//     writer.writeInt(obj.quantity);
//   }
// }
