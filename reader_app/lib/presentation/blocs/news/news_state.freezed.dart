// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<NewsArticle> previousArticles) loading,
    required TResult Function(
            List<NewsArticle> articles, DateTime lastUpdated, bool isRefreshing)
        loaded,
    required TResult Function(
            String message, List<NewsArticle> previousArticles)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NewsArticle> previousArticles)? loading,
    TResult? Function(List<NewsArticle> articles, DateTime lastUpdated,
            bool isRefreshing)?
        loaded,
    TResult? Function(String message, List<NewsArticle> previousArticles)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NewsArticle> previousArticles)? loading,
    TResult Function(List<NewsArticle> articles, DateTime lastUpdated,
            bool isRefreshing)?
        loaded,
    TResult Function(String message, List<NewsArticle> previousArticles)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsInitial value) initial,
    required TResult Function(NewsLoading value) loading,
    required TResult Function(NewsLoaded value) loaded,
    required TResult Function(NewsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsInitial value)? initial,
    TResult? Function(NewsLoading value)? loading,
    TResult? Function(NewsLoaded value)? loaded,
    TResult? Function(NewsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsInitial value)? initial,
    TResult Function(NewsLoading value)? loading,
    TResult Function(NewsLoaded value)? loaded,
    TResult Function(NewsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NewsInitialImplCopyWith<$Res> {
  factory _$$NewsInitialImplCopyWith(
          _$NewsInitialImpl value, $Res Function(_$NewsInitialImpl) then) =
      __$$NewsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewsInitialImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsInitialImpl>
    implements _$$NewsInitialImplCopyWith<$Res> {
  __$$NewsInitialImplCopyWithImpl(
      _$NewsInitialImpl _value, $Res Function(_$NewsInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NewsInitialImpl implements NewsInitial {
  const _$NewsInitialImpl();

  @override
  String toString() {
    return 'NewsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NewsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<NewsArticle> previousArticles) loading,
    required TResult Function(
            List<NewsArticle> articles, DateTime lastUpdated, bool isRefreshing)
        loaded,
    required TResult Function(
            String message, List<NewsArticle> previousArticles)
        error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NewsArticle> previousArticles)? loading,
    TResult? Function(List<NewsArticle> articles, DateTime lastUpdated,
            bool isRefreshing)?
        loaded,
    TResult? Function(String message, List<NewsArticle> previousArticles)?
        error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NewsArticle> previousArticles)? loading,
    TResult Function(List<NewsArticle> articles, DateTime lastUpdated,
            bool isRefreshing)?
        loaded,
    TResult Function(String message, List<NewsArticle> previousArticles)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsInitial value) initial,
    required TResult Function(NewsLoading value) loading,
    required TResult Function(NewsLoaded value) loaded,
    required TResult Function(NewsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsInitial value)? initial,
    TResult? Function(NewsLoading value)? loading,
    TResult? Function(NewsLoaded value)? loaded,
    TResult? Function(NewsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsInitial value)? initial,
    TResult Function(NewsLoading value)? loading,
    TResult Function(NewsLoaded value)? loaded,
    TResult Function(NewsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class NewsInitial implements NewsState {
  const factory NewsInitial() = _$NewsInitialImpl;
}

/// @nodoc
abstract class _$$NewsLoadingImplCopyWith<$Res> {
  factory _$$NewsLoadingImplCopyWith(
          _$NewsLoadingImpl value, $Res Function(_$NewsLoadingImpl) then) =
      __$$NewsLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NewsArticle> previousArticles});
}

/// @nodoc
class __$$NewsLoadingImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsLoadingImpl>
    implements _$$NewsLoadingImplCopyWith<$Res> {
  __$$NewsLoadingImplCopyWithImpl(
      _$NewsLoadingImpl _value, $Res Function(_$NewsLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previousArticles = null,
  }) {
    return _then(_$NewsLoadingImpl(
      previousArticles: null == previousArticles
          ? _value._previousArticles
          : previousArticles // ignore: cast_nullable_to_non_nullable
              as List<NewsArticle>,
    ));
  }
}

/// @nodoc

class _$NewsLoadingImpl implements NewsLoading {
  const _$NewsLoadingImpl({final List<NewsArticle> previousArticles = const []})
      : _previousArticles = previousArticles;

  /// Previously loaded articles to show while refreshing.
  final List<NewsArticle> _previousArticles;

  /// Previously loaded articles to show while refreshing.
  @override
  @JsonKey()
  List<NewsArticle> get previousArticles {
    if (_previousArticles is EqualUnmodifiableListView)
      return _previousArticles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_previousArticles);
  }

  @override
  String toString() {
    return 'NewsState.loading(previousArticles: $previousArticles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsLoadingImpl &&
            const DeepCollectionEquality()
                .equals(other._previousArticles, _previousArticles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_previousArticles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsLoadingImplCopyWith<_$NewsLoadingImpl> get copyWith =>
      __$$NewsLoadingImplCopyWithImpl<_$NewsLoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<NewsArticle> previousArticles) loading,
    required TResult Function(
            List<NewsArticle> articles, DateTime lastUpdated, bool isRefreshing)
        loaded,
    required TResult Function(
            String message, List<NewsArticle> previousArticles)
        error,
  }) {
    return loading(previousArticles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NewsArticle> previousArticles)? loading,
    TResult? Function(List<NewsArticle> articles, DateTime lastUpdated,
            bool isRefreshing)?
        loaded,
    TResult? Function(String message, List<NewsArticle> previousArticles)?
        error,
  }) {
    return loading?.call(previousArticles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NewsArticle> previousArticles)? loading,
    TResult Function(List<NewsArticle> articles, DateTime lastUpdated,
            bool isRefreshing)?
        loaded,
    TResult Function(String message, List<NewsArticle> previousArticles)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(previousArticles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsInitial value) initial,
    required TResult Function(NewsLoading value) loading,
    required TResult Function(NewsLoaded value) loaded,
    required TResult Function(NewsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsInitial value)? initial,
    TResult? Function(NewsLoading value)? loading,
    TResult? Function(NewsLoaded value)? loaded,
    TResult? Function(NewsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsInitial value)? initial,
    TResult Function(NewsLoading value)? loading,
    TResult Function(NewsLoaded value)? loaded,
    TResult Function(NewsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NewsLoading implements NewsState {
  const factory NewsLoading({final List<NewsArticle> previousArticles}) =
      _$NewsLoadingImpl;

  /// Previously loaded articles to show while refreshing.
  List<NewsArticle> get previousArticles;
  @JsonKey(ignore: true)
  _$$NewsLoadingImplCopyWith<_$NewsLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewsLoadedImplCopyWith<$Res> {
  factory _$$NewsLoadedImplCopyWith(
          _$NewsLoadedImpl value, $Res Function(_$NewsLoadedImpl) then) =
      __$$NewsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<NewsArticle> articles, DateTime lastUpdated, bool isRefreshing});
}

/// @nodoc
class __$$NewsLoadedImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsLoadedImpl>
    implements _$$NewsLoadedImplCopyWith<$Res> {
  __$$NewsLoadedImplCopyWithImpl(
      _$NewsLoadedImpl _value, $Res Function(_$NewsLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
    Object? lastUpdated = null,
    Object? isRefreshing = null,
  }) {
    return _then(_$NewsLoadedImpl(
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<NewsArticle>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NewsLoadedImpl implements NewsLoaded {
  const _$NewsLoadedImpl(
      {required final List<NewsArticle> articles,
      required this.lastUpdated,
      this.isRefreshing = false})
      : _articles = articles;

  final List<NewsArticle> _articles;
  @override
  List<NewsArticle> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  final DateTime lastUpdated;
  @override
  @JsonKey()
  final bool isRefreshing;

  @override
  String toString() {
    return 'NewsState.loaded(articles: $articles, lastUpdated: $lastUpdated, isRefreshing: $isRefreshing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsLoadedImpl &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_articles),
      lastUpdated,
      isRefreshing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsLoadedImplCopyWith<_$NewsLoadedImpl> get copyWith =>
      __$$NewsLoadedImplCopyWithImpl<_$NewsLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<NewsArticle> previousArticles) loading,
    required TResult Function(
            List<NewsArticle> articles, DateTime lastUpdated, bool isRefreshing)
        loaded,
    required TResult Function(
            String message, List<NewsArticle> previousArticles)
        error,
  }) {
    return loaded(articles, lastUpdated, isRefreshing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NewsArticle> previousArticles)? loading,
    TResult? Function(List<NewsArticle> articles, DateTime lastUpdated,
            bool isRefreshing)?
        loaded,
    TResult? Function(String message, List<NewsArticle> previousArticles)?
        error,
  }) {
    return loaded?.call(articles, lastUpdated, isRefreshing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NewsArticle> previousArticles)? loading,
    TResult Function(List<NewsArticle> articles, DateTime lastUpdated,
            bool isRefreshing)?
        loaded,
    TResult Function(String message, List<NewsArticle> previousArticles)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(articles, lastUpdated, isRefreshing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsInitial value) initial,
    required TResult Function(NewsLoading value) loading,
    required TResult Function(NewsLoaded value) loaded,
    required TResult Function(NewsError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsInitial value)? initial,
    TResult? Function(NewsLoading value)? loading,
    TResult? Function(NewsLoaded value)? loaded,
    TResult? Function(NewsError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsInitial value)? initial,
    TResult Function(NewsLoading value)? loading,
    TResult Function(NewsLoaded value)? loaded,
    TResult Function(NewsError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class NewsLoaded implements NewsState {
  const factory NewsLoaded(
      {required final List<NewsArticle> articles,
      required final DateTime lastUpdated,
      final bool isRefreshing}) = _$NewsLoadedImpl;

  List<NewsArticle> get articles;
  DateTime get lastUpdated;
  bool get isRefreshing;
  @JsonKey(ignore: true)
  _$$NewsLoadedImplCopyWith<_$NewsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewsErrorImplCopyWith<$Res> {
  factory _$$NewsErrorImplCopyWith(
          _$NewsErrorImpl value, $Res Function(_$NewsErrorImpl) then) =
      __$$NewsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, List<NewsArticle> previousArticles});
}

/// @nodoc
class __$$NewsErrorImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsErrorImpl>
    implements _$$NewsErrorImplCopyWith<$Res> {
  __$$NewsErrorImplCopyWithImpl(
      _$NewsErrorImpl _value, $Res Function(_$NewsErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? previousArticles = null,
  }) {
    return _then(_$NewsErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      previousArticles: null == previousArticles
          ? _value._previousArticles
          : previousArticles // ignore: cast_nullable_to_non_nullable
              as List<NewsArticle>,
    ));
  }
}

/// @nodoc

class _$NewsErrorImpl implements NewsError {
  const _$NewsErrorImpl(
      {required this.message,
      final List<NewsArticle> previousArticles = const []})
      : _previousArticles = previousArticles;

  @override
  final String message;

  /// Previously loaded articles to allow retry.
  final List<NewsArticle> _previousArticles;

  /// Previously loaded articles to allow retry.
  @override
  @JsonKey()
  List<NewsArticle> get previousArticles {
    if (_previousArticles is EqualUnmodifiableListView)
      return _previousArticles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_previousArticles);
  }

  @override
  String toString() {
    return 'NewsState.error(message: $message, previousArticles: $previousArticles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._previousArticles, _previousArticles));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(_previousArticles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsErrorImplCopyWith<_$NewsErrorImpl> get copyWith =>
      __$$NewsErrorImplCopyWithImpl<_$NewsErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<NewsArticle> previousArticles) loading,
    required TResult Function(
            List<NewsArticle> articles, DateTime lastUpdated, bool isRefreshing)
        loaded,
    required TResult Function(
            String message, List<NewsArticle> previousArticles)
        error,
  }) {
    return error(message, previousArticles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<NewsArticle> previousArticles)? loading,
    TResult? Function(List<NewsArticle> articles, DateTime lastUpdated,
            bool isRefreshing)?
        loaded,
    TResult? Function(String message, List<NewsArticle> previousArticles)?
        error,
  }) {
    return error?.call(message, previousArticles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<NewsArticle> previousArticles)? loading,
    TResult Function(List<NewsArticle> articles, DateTime lastUpdated,
            bool isRefreshing)?
        loaded,
    TResult Function(String message, List<NewsArticle> previousArticles)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, previousArticles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsInitial value) initial,
    required TResult Function(NewsLoading value) loading,
    required TResult Function(NewsLoaded value) loaded,
    required TResult Function(NewsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsInitial value)? initial,
    TResult? Function(NewsLoading value)? loading,
    TResult? Function(NewsLoaded value)? loaded,
    TResult? Function(NewsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsInitial value)? initial,
    TResult Function(NewsLoading value)? loading,
    TResult Function(NewsLoaded value)? loaded,
    TResult Function(NewsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NewsError implements NewsState {
  const factory NewsError(
      {required final String message,
      final List<NewsArticle> previousArticles}) = _$NewsErrorImpl;

  String get message;

  /// Previously loaded articles to allow retry.
  List<NewsArticle> get previousArticles;
  @JsonKey(ignore: true)
  _$$NewsErrorImplCopyWith<_$NewsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
