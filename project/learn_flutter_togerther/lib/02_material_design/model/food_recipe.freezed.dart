// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodRecipe _$FoodRecipeFromJson(Map<String, dynamic> json) {
  return _FoodRecipe.fromJson(json);
}

/// @nodoc
mixin _$FoodRecipe {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodRecipeCopyWith<FoodRecipe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodRecipeCopyWith<$Res> {
  factory $FoodRecipeCopyWith(
          FoodRecipe value, $Res Function(FoodRecipe) then) =
      _$FoodRecipeCopyWithImpl<$Res, FoodRecipe>;
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class _$FoodRecipeCopyWithImpl<$Res, $Val extends FoodRecipe>
    implements $FoodRecipeCopyWith<$Res> {
  _$FoodRecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodRecipeImplCopyWith<$Res>
    implements $FoodRecipeCopyWith<$Res> {
  factory _$$FoodRecipeImplCopyWith(
          _$FoodRecipeImpl value, $Res Function(_$FoodRecipeImpl) then) =
      __$$FoodRecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class __$$FoodRecipeImplCopyWithImpl<$Res>
    extends _$FoodRecipeCopyWithImpl<$Res, _$FoodRecipeImpl>
    implements _$$FoodRecipeImplCopyWith<$Res> {
  __$$FoodRecipeImplCopyWithImpl(
      _$FoodRecipeImpl _value, $Res Function(_$FoodRecipeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$FoodRecipeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodRecipeImpl implements _FoodRecipe {
  const _$FoodRecipeImpl(
      {required this.name, required this.email, required this.password});

  factory _$FoodRecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodRecipeImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'FoodRecipe(name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodRecipeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodRecipeImplCopyWith<_$FoodRecipeImpl> get copyWith =>
      __$$FoodRecipeImplCopyWithImpl<_$FoodRecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodRecipeImplToJson(
      this,
    );
  }
}

abstract class _FoodRecipe implements FoodRecipe {
  const factory _FoodRecipe(
      {required final String name,
      required final String email,
      required final String password}) = _$FoodRecipeImpl;

  factory _FoodRecipe.fromJson(Map<String, dynamic> json) =
      _$FoodRecipeImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$FoodRecipeImplCopyWith<_$FoodRecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
