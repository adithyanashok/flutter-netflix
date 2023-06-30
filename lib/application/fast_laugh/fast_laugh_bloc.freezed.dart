// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fast_laugh_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FastLaughEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int id) like,
    required TResult Function(int id) unLike,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int id)? like,
    TResult? Function(int id)? unLike,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int id)? like,
    TResult Function(int id)? unLike,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(Like value) like,
    required TResult Function(UnLike value) unLike,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(Like value)? like,
    TResult? Function(UnLike value)? unLike,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(Like value)? like,
    TResult Function(UnLike value)? unLike,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FastLaughEventCopyWith<$Res> {
  factory $FastLaughEventCopyWith(
          FastLaughEvent value, $Res Function(FastLaughEvent) then) =
      _$FastLaughEventCopyWithImpl<$Res, FastLaughEvent>;
}

/// @nodoc
class _$FastLaughEventCopyWithImpl<$Res, $Val extends FastLaughEvent>
    implements $FastLaughEventCopyWith<$Res> {
  _$FastLaughEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeCopyWith<$Res> {
  factory _$$InitializeCopyWith(
          _$Initialize value, $Res Function(_$Initialize) then) =
      __$$InitializeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeCopyWithImpl<$Res>
    extends _$FastLaughEventCopyWithImpl<$Res, _$Initialize>
    implements _$$InitializeCopyWith<$Res> {
  __$$InitializeCopyWithImpl(
      _$Initialize _value, $Res Function(_$Initialize) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initialize implements Initialize {
  const _$Initialize();

  @override
  String toString() {
    return 'FastLaughEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initialize);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int id) like,
    required TResult Function(int id) unLike,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int id)? like,
    TResult? Function(int id)? unLike,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int id)? like,
    TResult Function(int id)? unLike,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(Like value) like,
    required TResult Function(UnLike value) unLike,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(Like value)? like,
    TResult? Function(UnLike value)? unLike,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(Like value)? like,
    TResult Function(UnLike value)? unLike,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class Initialize implements FastLaughEvent {
  const factory Initialize() = _$Initialize;
}

/// @nodoc
abstract class _$$LikeCopyWith<$Res> {
  factory _$$LikeCopyWith(_$Like value, $Res Function(_$Like) then) =
      __$$LikeCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$LikeCopyWithImpl<$Res>
    extends _$FastLaughEventCopyWithImpl<$Res, _$Like>
    implements _$$LikeCopyWith<$Res> {
  __$$LikeCopyWithImpl(_$Like _value, $Res Function(_$Like) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$Like(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Like implements Like {
  const _$Like({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'FastLaughEvent.like(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Like &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeCopyWith<_$Like> get copyWith =>
      __$$LikeCopyWithImpl<_$Like>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int id) like,
    required TResult Function(int id) unLike,
  }) {
    return like(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int id)? like,
    TResult? Function(int id)? unLike,
  }) {
    return like?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int id)? like,
    TResult Function(int id)? unLike,
    required TResult orElse(),
  }) {
    if (like != null) {
      return like(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(Like value) like,
    required TResult Function(UnLike value) unLike,
  }) {
    return like(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(Like value)? like,
    TResult? Function(UnLike value)? unLike,
  }) {
    return like?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(Like value)? like,
    TResult Function(UnLike value)? unLike,
    required TResult orElse(),
  }) {
    if (like != null) {
      return like(this);
    }
    return orElse();
  }
}

abstract class Like implements FastLaughEvent {
  const factory Like({required final int id}) = _$Like;

  int get id;
  @JsonKey(ignore: true)
  _$$LikeCopyWith<_$Like> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnLikeCopyWith<$Res> {
  factory _$$UnLikeCopyWith(_$UnLike value, $Res Function(_$UnLike) then) =
      __$$UnLikeCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$UnLikeCopyWithImpl<$Res>
    extends _$FastLaughEventCopyWithImpl<$Res, _$UnLike>
    implements _$$UnLikeCopyWith<$Res> {
  __$$UnLikeCopyWithImpl(_$UnLike _value, $Res Function(_$UnLike) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$UnLike(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UnLike implements UnLike {
  const _$UnLike({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'FastLaughEvent.unLike(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnLike &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnLikeCopyWith<_$UnLike> get copyWith =>
      __$$UnLikeCopyWithImpl<_$UnLike>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int id) like,
    required TResult Function(int id) unLike,
  }) {
    return unLike(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(int id)? like,
    TResult? Function(int id)? unLike,
  }) {
    return unLike?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int id)? like,
    TResult Function(int id)? unLike,
    required TResult orElse(),
  }) {
    if (unLike != null) {
      return unLike(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(Like value) like,
    required TResult Function(UnLike value) unLike,
  }) {
    return unLike(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(Like value)? like,
    TResult? Function(UnLike value)? unLike,
  }) {
    return unLike?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(Like value)? like,
    TResult Function(UnLike value)? unLike,
    required TResult orElse(),
  }) {
    if (unLike != null) {
      return unLike(this);
    }
    return orElse();
  }
}

abstract class UnLike implements FastLaughEvent {
  const factory UnLike({required final int id}) = _$UnLike;

  int get id;
  @JsonKey(ignore: true)
  _$$UnLikeCopyWith<_$UnLike> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FastLaughState {
  List<Downloads> get videoList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FastLaughStateCopyWith<FastLaughState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FastLaughStateCopyWith<$Res> {
  factory $FastLaughStateCopyWith(
          FastLaughState value, $Res Function(FastLaughState) then) =
      _$FastLaughStateCopyWithImpl<$Res, FastLaughState>;
  @useResult
  $Res call({List<Downloads> videoList, bool isLoading, bool isError});
}

/// @nodoc
class _$FastLaughStateCopyWithImpl<$Res, $Val extends FastLaughState>
    implements $FastLaughStateCopyWith<$Res> {
  _$FastLaughStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoList = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      videoList: null == videoList
          ? _value.videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitializeCopyWith<$Res>
    implements $FastLaughStateCopyWith<$Res> {
  factory _$$_InitializeCopyWith(
          _$_Initialize value, $Res Function(_$_Initialize) then) =
      __$$_InitializeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Downloads> videoList, bool isLoading, bool isError});
}

/// @nodoc
class __$$_InitializeCopyWithImpl<$Res>
    extends _$FastLaughStateCopyWithImpl<$Res, _$_Initialize>
    implements _$$_InitializeCopyWith<$Res> {
  __$$_InitializeCopyWithImpl(
      _$_Initialize _value, $Res Function(_$_Initialize) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoList = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_$_Initialize(
      videoList: null == videoList
          ? _value._videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initialize implements _Initialize {
  const _$_Initialize(
      {final List<Downloads> videoList = const [],
      required this.isLoading,
      required this.isError})
      : _videoList = videoList;

  final List<Downloads> _videoList;
  @override
  @JsonKey()
  List<Downloads> get videoList {
    if (_videoList is EqualUnmodifiableListView) return _videoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoList);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'FastLaughState(videoList: $videoList, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialize &&
            const DeepCollectionEquality()
                .equals(other._videoList, _videoList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_videoList), isLoading, isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializeCopyWith<_$_Initialize> get copyWith =>
      __$$_InitializeCopyWithImpl<_$_Initialize>(this, _$identity);
}

abstract class _Initialize implements FastLaughState {
  const factory _Initialize(
      {final List<Downloads> videoList,
      required final bool isLoading,
      required final bool isError}) = _$_Initialize;

  @override
  List<Downloads> get videoList;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$_InitializeCopyWith<_$_Initialize> get copyWith =>
      throw _privateConstructorUsedError;
}
