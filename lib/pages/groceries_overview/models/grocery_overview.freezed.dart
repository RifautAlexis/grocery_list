// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grocery_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroceryOverview _$GroceryOverviewFromJson(Map<String, dynamic> json) {
  return _GroceryOverview.fromJson(json);
}

/// @nodoc
mixin _$GroceryOverview {
  String get productName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroceryOverviewCopyWith<GroceryOverview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroceryOverviewCopyWith<$Res> {
  factory $GroceryOverviewCopyWith(
          GroceryOverview value, $Res Function(GroceryOverview) then) =
      _$GroceryOverviewCopyWithImpl<$Res, GroceryOverview>;
  @useResult
  $Res call({String productName, int quantity});
}

/// @nodoc
class _$GroceryOverviewCopyWithImpl<$Res, $Val extends GroceryOverview>
    implements $GroceryOverviewCopyWith<$Res> {
  _$GroceryOverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GroceryOverviewCopyWith<$Res>
    implements $GroceryOverviewCopyWith<$Res> {
  factory _$$_GroceryOverviewCopyWith(
          _$_GroceryOverview value, $Res Function(_$_GroceryOverview) then) =
      __$$_GroceryOverviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productName, int quantity});
}

/// @nodoc
class __$$_GroceryOverviewCopyWithImpl<$Res>
    extends _$GroceryOverviewCopyWithImpl<$Res, _$_GroceryOverview>
    implements _$$_GroceryOverviewCopyWith<$Res> {
  __$$_GroceryOverviewCopyWithImpl(
      _$_GroceryOverview _value, $Res Function(_$_GroceryOverview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? quantity = null,
  }) {
    return _then(_$_GroceryOverview(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
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
class _$_GroceryOverview
    with DiagnosticableTreeMixin
    implements _GroceryOverview {
  _$_GroceryOverview({required this.productName, required this.quantity})
      : assert(productName.isNotEmpty, 'productName cannot be empty'),
        assert(quantity >= 0, 'quantity has to be equals or superior to 0');

  factory _$_GroceryOverview.fromJson(Map<String, dynamic> json) =>
      _$$_GroceryOverviewFromJson(json);

  @override
  final String productName;
  @override
  final int quantity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GroceryOverview(productName: $productName, quantity: $quantity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GroceryOverview'))
      ..add(DiagnosticsProperty('productName', productName))
      ..add(DiagnosticsProperty('quantity', quantity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GroceryOverview &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productName, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GroceryOverviewCopyWith<_$_GroceryOverview> get copyWith =>
      __$$_GroceryOverviewCopyWithImpl<_$_GroceryOverview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroceryOverviewToJson(
      this,
    );
  }
}

abstract class _GroceryOverview implements GroceryOverview {
  factory _GroceryOverview(
      {required final String productName,
      required final int quantity}) = _$_GroceryOverview;

  factory _GroceryOverview.fromJson(Map<String, dynamic> json) =
      _$_GroceryOverview.fromJson;

  @override
  String get productName;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_GroceryOverviewCopyWith<_$_GroceryOverview> get copyWith =>
      throw _privateConstructorUsedError;
}
