// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'infinite_image_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InfiniteImagesState {
  GammaController get gammaController => throw _privateConstructorUsedError;
  ScrollController get scrollController => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<String> get imagesList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InfiniteImagesStateCopyWith<InfiniteImagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfiniteImagesStateCopyWith<$Res> {
  factory $InfiniteImagesStateCopyWith(
          InfiniteImagesState value, $Res Function(InfiniteImagesState) then) =
      _$InfiniteImagesStateCopyWithImpl<$Res, InfiniteImagesState>;
  @useResult
  $Res call(
      {GammaController gammaController,
      ScrollController scrollController,
      bool isLoading,
      List<String> imagesList});
}

/// @nodoc
class _$InfiniteImagesStateCopyWithImpl<$Res, $Val extends InfiniteImagesState>
    implements $InfiniteImagesStateCopyWith<$Res> {
  _$InfiniteImagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gammaController = null,
    Object? scrollController = null,
    Object? isLoading = null,
    Object? imagesList = null,
  }) {
    return _then(_value.copyWith(
      gammaController: null == gammaController
          ? _value.gammaController
          : gammaController // ignore: cast_nullable_to_non_nullable
              as GammaController,
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      imagesList: null == imagesList
          ? _value.imagesList
          : imagesList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InfiniteImagesStateImplCopyWith<$Res>
    implements $InfiniteImagesStateCopyWith<$Res> {
  factory _$$InfiniteImagesStateImplCopyWith(_$InfiniteImagesStateImpl value,
          $Res Function(_$InfiniteImagesStateImpl) then) =
      __$$InfiniteImagesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GammaController gammaController,
      ScrollController scrollController,
      bool isLoading,
      List<String> imagesList});
}

/// @nodoc
class __$$InfiniteImagesStateImplCopyWithImpl<$Res>
    extends _$InfiniteImagesStateCopyWithImpl<$Res, _$InfiniteImagesStateImpl>
    implements _$$InfiniteImagesStateImplCopyWith<$Res> {
  __$$InfiniteImagesStateImplCopyWithImpl(_$InfiniteImagesStateImpl _value,
      $Res Function(_$InfiniteImagesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gammaController = null,
    Object? scrollController = null,
    Object? isLoading = null,
    Object? imagesList = null,
  }) {
    return _then(_$InfiniteImagesStateImpl(
      gammaController: null == gammaController
          ? _value.gammaController
          : gammaController // ignore: cast_nullable_to_non_nullable
              as GammaController,
      scrollController: null == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      imagesList: null == imagesList
          ? _value._imagesList
          : imagesList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$InfiniteImagesStateImpl implements _InfiniteImagesState {
  const _$InfiniteImagesStateImpl(
      {required this.gammaController,
      required this.scrollController,
      this.isLoading = false,
      final List<String> imagesList = const []})
      : _imagesList = imagesList;

  @override
  final GammaController gammaController;
  @override
  final ScrollController scrollController;
  @override
  @JsonKey()
  final bool isLoading;
  final List<String> _imagesList;
  @override
  @JsonKey()
  List<String> get imagesList {
    if (_imagesList is EqualUnmodifiableListView) return _imagesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesList);
  }

  @override
  String toString() {
    return 'InfiniteImagesState(gammaController: $gammaController, scrollController: $scrollController, isLoading: $isLoading, imagesList: $imagesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfiniteImagesStateImpl &&
            (identical(other.gammaController, gammaController) ||
                other.gammaController == gammaController) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._imagesList, _imagesList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      gammaController,
      scrollController,
      isLoading,
      const DeepCollectionEquality().hash(_imagesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InfiniteImagesStateImplCopyWith<_$InfiniteImagesStateImpl> get copyWith =>
      __$$InfiniteImagesStateImplCopyWithImpl<_$InfiniteImagesStateImpl>(
          this, _$identity);
}

abstract class _InfiniteImagesState implements InfiniteImagesState {
  const factory _InfiniteImagesState(
      {required final GammaController gammaController,
      required final ScrollController scrollController,
      final bool isLoading,
      final List<String> imagesList}) = _$InfiniteImagesStateImpl;

  @override
  GammaController get gammaController;
  @override
  ScrollController get scrollController;
  @override
  bool get isLoading;
  @override
  List<String> get imagesList;
  @override
  @JsonKey(ignore: true)
  _$$InfiniteImagesStateImplCopyWith<_$InfiniteImagesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
