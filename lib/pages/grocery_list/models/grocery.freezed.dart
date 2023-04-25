// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grocery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Grocery _$GroceryFromJson(Map<String, dynamic> json) {
  return _Grocery.fromJson(json);
}

/// @nodoc
mixin _$Grocery {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroceryCopyWith<Grocery> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroceryCopyWith<$Res> {
  factory $GroceryCopyWith(Grocery value, $Res Function(Grocery) then) =
      _$GroceryCopyWithImpl<$Res, Grocery>;
  @useResult
  $Res call({@HiveField(0) String name, @HiveField(1) int quantity});
}

/// @nodoc
class _$GroceryCopyWithImpl<$Res, $Val extends Grocery>
    implements $GroceryCopyWith<$Res> {
  _$GroceryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GroceryCopyWith<$Res> implements $GroceryCopyWith<$Res> {
  factory _$$_GroceryCopyWith(
          _$_Grocery value, $Res Function(_$_Grocery) then) =
      __$$_GroceryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String name, @HiveField(1) int quantity});
}

/// @nodoc
class __$$_GroceryCopyWithImpl<$Res>
    extends _$GroceryCopyWithImpl<$Res, _$_Grocery>
    implements _$$_GroceryCopyWith<$Res> {
  __$$_GroceryCopyWithImpl(_$_Grocery _value, $Res Function(_$_Grocery) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
  }) {
    return _then(_$_Grocery(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2)
class _$_Grocery extends _Grocery with DiagnosticableTreeMixin {
  _$_Grocery(
      {@HiveField(0) required this.name, @HiveField(1) required this.quantity})
      : assert(name.isNotEmpty, 'name cannot be empty'),
        assert(quantity >= 0, 'quantity has to be equals or superior to 0'),
        super._();

  factory _$_Grocery.fromJson(Map<String, dynamic> json) =>
      _$$_GroceryFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final int quantity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Grocery(name: $name, quantity: $quantity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Grocery'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('quantity', quantity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Grocery &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GroceryCopyWith<_$_Grocery> get copyWith =>
      __$$_GroceryCopyWithImpl<_$_Grocery>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroceryToJson(
      this,
    );
  }
}

abstract class _Grocery extends Grocery {
  factory _Grocery(
      {@HiveField(0) required final String name,
      @HiveField(1) required final int quantity}) = _$_Grocery;
  _Grocery._() : super._();

  factory _Grocery.fromJson(Map<String, dynamic> json) = _$_Grocery.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_GroceryCopyWith<_$_Grocery> get copyWith =>
      throw _privateConstructorUsedError;
}
