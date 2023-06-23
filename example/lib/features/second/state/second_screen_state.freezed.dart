// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'second_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SecondScreenState {
  GammaSmartController get hrAppRefreshController =>
      throw _privateConstructorUsedError;
  ScrollController get scrollController => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<String> get itemsList => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  int get perPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SecondScreenStateCopyWith<SecondScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecondScreenStateCopyWith<$Res> {
  factory $SecondScreenStateCopyWith(
          SecondScreenState value, $Res Function(SecondScreenState) then) =
      _$SecondScreenStateCopyWithImpl<$Res, SecondScreenState>;
  @useResult
  $Res call(
      {GammaSmartController hrAppRefreshController,
      ScrollController scrollController,
      bool isLoading,
      List<String> itemsList,
      bool hasNext,
      int perPage});
}

/// @nodoc
class _$SecondScreenStateCopyWithImpl<$Res, $Val extends SecondScreenState>
    implements $SecondScreenStateCopyWith<$Res> {
  _$SecondScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hrAppRefreshController = null,
    Object? scrollController = null,
    Object? isLoading = null,
    Object? itemsList = null,
    Object? hasNext = null,
    Object? perPage = null,
  }) {
    return _then(_value.copyWith(
      hrAppRefreshController: null == hrAppRefreshController
          ? _value.hrAppRefreshController
          : hrAppRefreshController // ignore: cast_nullable_to_non_nullable
              as GammaSmartController,
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      itemsList: null == itemsList
          ? _value.itemsList
          : itemsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SecondScreenStateCopyWith<$Res>
    implements $SecondScreenStateCopyWith<$Res> {
  factory _$$_SecondScreenStateCopyWith(_$_SecondScreenState value,
          $Res Function(_$_SecondScreenState) then) =
      __$$_SecondScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GammaSmartController hrAppRefreshController,
      ScrollController scrollController,
      bool isLoading,
      List<String> itemsList,
      bool hasNext,
      int perPage});
}

/// @nodoc
class __$$_SecondScreenStateCopyWithImpl<$Res>
    extends _$SecondScreenStateCopyWithImpl<$Res, _$_SecondScreenState>
    implements _$$_SecondScreenStateCopyWith<$Res> {
  __$$_SecondScreenStateCopyWithImpl(
      _$_SecondScreenState _value, $Res Function(_$_SecondScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hrAppRefreshController = null,
    Object? scrollController = null,
    Object? isLoading = null,
    Object? itemsList = null,
    Object? hasNext = null,
    Object? perPage = null,
  }) {
    return _then(_$_SecondScreenState(
      hrAppRefreshController: null == hrAppRefreshController
          ? _value.hrAppRefreshController
          : hrAppRefreshController // ignore: cast_nullable_to_non_nullable
              as GammaSmartController,
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      itemsList: null == itemsList
          ? _value._itemsList
          : itemsList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SecondScreenState implements _SecondScreenState {
  const _$_SecondScreenState(
      {required this.hrAppRefreshController,
      required this.scrollController,
      this.isLoading = false,
      final List<String> itemsList = const [],
      this.hasNext = false,
      this.perPage = 20})
      : _itemsList = itemsList;

  @override
  final GammaSmartController hrAppRefreshController;
  @override
  final ScrollController scrollController;
  @override
  @JsonKey()
  final bool isLoading;
  final List<String> _itemsList;
  @override
  @JsonKey()
  List<String> get itemsList {
    if (_itemsList is EqualUnmodifiableListView) return _itemsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemsList);
  }

  @override
  @JsonKey()
  final bool hasNext;
  @override
  @JsonKey()
  final int perPage;

  @override
  String toString() {
    return 'SecondScreenState(hrAppRefreshController: $hrAppRefreshController, scrollController: $scrollController, isLoading: $isLoading, itemsList: $itemsList, hasNext: $hasNext, perPage: $perPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SecondScreenState &&
            (identical(other.hrAppRefreshController, hrAppRefreshController) ||
                other.hrAppRefreshController == hrAppRefreshController) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._itemsList, _itemsList) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.perPage, perPage) || other.perPage == perPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      hrAppRefreshController,
      scrollController,
      isLoading,
      const DeepCollectionEquality().hash(_itemsList),
      hasNext,
      perPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SecondScreenStateCopyWith<_$_SecondScreenState> get copyWith =>
      __$$_SecondScreenStateCopyWithImpl<_$_SecondScreenState>(
          this, _$identity);
}

abstract class _SecondScreenState implements SecondScreenState {
  const factory _SecondScreenState(
      {required final GammaSmartController hrAppRefreshController,
      required final ScrollController scrollController,
      final bool isLoading,
      final List<String> itemsList,
      final bool hasNext,
      final int perPage}) = _$_SecondScreenState;

  @override
  GammaSmartController get hrAppRefreshController;
  @override
  ScrollController get scrollController;
  @override
  bool get isLoading;
  @override
  List<String> get itemsList;
  @override
  bool get hasNext;
  @override
  int get perPage;
  @override
  @JsonKey(ignore: true)
  _$$_SecondScreenStateCopyWith<_$_SecondScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
