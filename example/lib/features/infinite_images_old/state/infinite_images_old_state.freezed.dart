// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'infinite_images_old_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InfiniteImagesOldState {
  GammaController get gammaController => throw _privateConstructorUsedError;
  ScrollController get scrollController => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<String> get imagesList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InfiniteImagesOldStateCopyWith<InfiniteImagesOldState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfiniteImagesOldStateCopyWith<$Res> {
  factory $InfiniteImagesOldStateCopyWith(InfiniteImagesOldState value,
          $Res Function(InfiniteImagesOldState) then) =
      _$InfiniteImagesOldStateCopyWithImpl<$Res, InfiniteImagesOldState>;
  @useResult
  $Res call(
      {GammaController gammaController,
      ScrollController scrollController,
      bool isLoading,
      List<String> imagesList});
}

/// @nodoc
class _$InfiniteImagesOldStateCopyWithImpl<$Res,
        $Val extends InfiniteImagesOldState>
    implements $InfiniteImagesOldStateCopyWith<$Res> {
  _$InfiniteImagesOldStateCopyWithImpl(this._value, this._then);

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
abstract class _$$InfiniteImagesOldStateImplCopyWith<$Res>
    implements $InfiniteImagesOldStateCopyWith<$Res> {
  factory _$$InfiniteImagesOldStateImplCopyWith(
          _$InfiniteImagesOldStateImpl value,
          $Res Function(_$InfiniteImagesOldStateImpl) then) =
      __$$InfiniteImagesOldStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GammaController gammaController,
      ScrollController scrollController,
      bool isLoading,
      List<String> imagesList});
}

/// @nodoc
class __$$InfiniteImagesOldStateImplCopyWithImpl<$Res>
    extends _$InfiniteImagesOldStateCopyWithImpl<$Res,
        _$InfiniteImagesOldStateImpl>
    implements _$$InfiniteImagesOldStateImplCopyWith<$Res> {
  __$$InfiniteImagesOldStateImplCopyWithImpl(
      _$InfiniteImagesOldStateImpl _value,
      $Res Function(_$InfiniteImagesOldStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gammaController = null,
    Object? scrollController = null,
    Object? isLoading = null,
    Object? imagesList = null,
  }) {
    return _then(_$InfiniteImagesOldStateImpl(
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

class _$InfiniteImagesOldStateImpl implements _InfiniteImagesOldState {
  const _$InfiniteImagesOldStateImpl(
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
    return 'InfiniteImagesOldState(gammaController: $gammaController, scrollController: $scrollController, isLoading: $isLoading, imagesList: $imagesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfiniteImagesOldStateImpl &&
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
  _$$InfiniteImagesOldStateImplCopyWith<_$InfiniteImagesOldStateImpl>
      get copyWith => __$$InfiniteImagesOldStateImplCopyWithImpl<
          _$InfiniteImagesOldStateImpl>(this, _$identity);
}

abstract class _InfiniteImagesOldState implements InfiniteImagesOldState {
  const factory _InfiniteImagesOldState(
      {required final GammaController gammaController,
      required final ScrollController scrollController,
      final bool isLoading,
      final List<String> imagesList}) = _$InfiniteImagesOldStateImpl;

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
  _$$InfiniteImagesOldStateImplCopyWith<_$InfiniteImagesOldStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
