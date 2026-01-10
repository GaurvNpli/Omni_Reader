// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LibraryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LibraryInitial value) initial,
    required TResult Function(LibraryLoading value) loading,
    required TResult Function(LibraryLoaded value) loaded,
    required TResult Function(LibraryError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibraryInitial value)? initial,
    TResult? Function(LibraryLoading value)? loading,
    TResult? Function(LibraryLoaded value)? loaded,
    TResult? Function(LibraryError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibraryInitial value)? initial,
    TResult Function(LibraryLoading value)? loading,
    TResult Function(LibraryLoaded value)? loaded,
    TResult Function(LibraryError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryStateCopyWith<$Res> {
  factory $LibraryStateCopyWith(
          LibraryState value, $Res Function(LibraryState) then) =
      _$LibraryStateCopyWithImpl<$Res, LibraryState>;
}

/// @nodoc
class _$LibraryStateCopyWithImpl<$Res, $Val extends LibraryState>
    implements $LibraryStateCopyWith<$Res> {
  _$LibraryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LibraryInitialImplCopyWith<$Res> {
  factory _$$LibraryInitialImplCopyWith(_$LibraryInitialImpl value,
          $Res Function(_$LibraryInitialImpl) then) =
      __$$LibraryInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LibraryInitialImplCopyWithImpl<$Res>
    extends _$LibraryStateCopyWithImpl<$Res, _$LibraryInitialImpl>
    implements _$$LibraryInitialImplCopyWith<$Res> {
  __$$LibraryInitialImplCopyWithImpl(
      _$LibraryInitialImpl _value, $Res Function(_$LibraryInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LibraryInitialImpl implements LibraryInitial {
  const _$LibraryInitialImpl();

  @override
  String toString() {
    return 'LibraryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LibraryInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)?
        loaded,
    TResult Function(String message)? error,
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
    required TResult Function(LibraryInitial value) initial,
    required TResult Function(LibraryLoading value) loading,
    required TResult Function(LibraryLoaded value) loaded,
    required TResult Function(LibraryError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibraryInitial value)? initial,
    TResult? Function(LibraryLoading value)? loading,
    TResult? Function(LibraryLoaded value)? loaded,
    TResult? Function(LibraryError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibraryInitial value)? initial,
    TResult Function(LibraryLoading value)? loading,
    TResult Function(LibraryLoaded value)? loaded,
    TResult Function(LibraryError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LibraryInitial implements LibraryState {
  const factory LibraryInitial() = _$LibraryInitialImpl;
}

/// @nodoc
abstract class _$$LibraryLoadingImplCopyWith<$Res> {
  factory _$$LibraryLoadingImplCopyWith(_$LibraryLoadingImpl value,
          $Res Function(_$LibraryLoadingImpl) then) =
      __$$LibraryLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LibraryLoadingImplCopyWithImpl<$Res>
    extends _$LibraryStateCopyWithImpl<$Res, _$LibraryLoadingImpl>
    implements _$$LibraryLoadingImplCopyWith<$Res> {
  __$$LibraryLoadingImplCopyWithImpl(
      _$LibraryLoadingImpl _value, $Res Function(_$LibraryLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LibraryLoadingImpl implements LibraryLoading {
  const _$LibraryLoadingImpl();

  @override
  String toString() {
    return 'LibraryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LibraryLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LibraryInitial value) initial,
    required TResult Function(LibraryLoading value) loading,
    required TResult Function(LibraryLoaded value) loaded,
    required TResult Function(LibraryError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibraryInitial value)? initial,
    TResult? Function(LibraryLoading value)? loading,
    TResult? Function(LibraryLoaded value)? loaded,
    TResult? Function(LibraryError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibraryInitial value)? initial,
    TResult Function(LibraryLoading value)? loading,
    TResult Function(LibraryLoaded value)? loaded,
    TResult Function(LibraryError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LibraryLoading implements LibraryState {
  const factory LibraryLoading() = _$LibraryLoadingImpl;
}

/// @nodoc
abstract class _$$LibraryLoadedImplCopyWith<$Res> {
  factory _$$LibraryLoadedImplCopyWith(
          _$LibraryLoadedImpl value, $Res Function(_$LibraryLoadedImpl) then) =
      __$$LibraryLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Book> featuredBooks,
      List<DownloadedFile> downloadedFiles,
      Map<String, double> downloadProgress,
      Set<String> activeDownloads});
}

/// @nodoc
class __$$LibraryLoadedImplCopyWithImpl<$Res>
    extends _$LibraryStateCopyWithImpl<$Res, _$LibraryLoadedImpl>
    implements _$$LibraryLoadedImplCopyWith<$Res> {
  __$$LibraryLoadedImplCopyWithImpl(
      _$LibraryLoadedImpl _value, $Res Function(_$LibraryLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featuredBooks = null,
    Object? downloadedFiles = null,
    Object? downloadProgress = null,
    Object? activeDownloads = null,
  }) {
    return _then(_$LibraryLoadedImpl(
      featuredBooks: null == featuredBooks
          ? _value._featuredBooks
          : featuredBooks // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      downloadedFiles: null == downloadedFiles
          ? _value._downloadedFiles
          : downloadedFiles // ignore: cast_nullable_to_non_nullable
              as List<DownloadedFile>,
      downloadProgress: null == downloadProgress
          ? _value._downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      activeDownloads: null == activeDownloads
          ? _value._activeDownloads
          : activeDownloads // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$LibraryLoadedImpl implements LibraryLoaded {
  const _$LibraryLoadedImpl(
      {required final List<Book> featuredBooks,
      required final List<DownloadedFile> downloadedFiles,
      final Map<String, double> downloadProgress = const {},
      final Set<String> activeDownloads = const {}})
      : _featuredBooks = featuredBooks,
        _downloadedFiles = downloadedFiles,
        _downloadProgress = downloadProgress,
        _activeDownloads = activeDownloads;

  final List<Book> _featuredBooks;
  @override
  List<Book> get featuredBooks {
    if (_featuredBooks is EqualUnmodifiableListView) return _featuredBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_featuredBooks);
  }

  final List<DownloadedFile> _downloadedFiles;
  @override
  List<DownloadedFile> get downloadedFiles {
    if (_downloadedFiles is EqualUnmodifiableListView) return _downloadedFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downloadedFiles);
  }

  final Map<String, double> _downloadProgress;
  @override
  @JsonKey()
  Map<String, double> get downloadProgress {
    if (_downloadProgress is EqualUnmodifiableMapView) return _downloadProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_downloadProgress);
  }

  final Set<String> _activeDownloads;
  @override
  @JsonKey()
  Set<String> get activeDownloads {
    if (_activeDownloads is EqualUnmodifiableSetView) return _activeDownloads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_activeDownloads);
  }

  @override
  String toString() {
    return 'LibraryState.loaded(featuredBooks: $featuredBooks, downloadedFiles: $downloadedFiles, downloadProgress: $downloadProgress, activeDownloads: $activeDownloads)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._featuredBooks, _featuredBooks) &&
            const DeepCollectionEquality()
                .equals(other._downloadedFiles, _downloadedFiles) &&
            const DeepCollectionEquality()
                .equals(other._downloadProgress, _downloadProgress) &&
            const DeepCollectionEquality()
                .equals(other._activeDownloads, _activeDownloads));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_featuredBooks),
      const DeepCollectionEquality().hash(_downloadedFiles),
      const DeepCollectionEquality().hash(_downloadProgress),
      const DeepCollectionEquality().hash(_activeDownloads));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryLoadedImplCopyWith<_$LibraryLoadedImpl> get copyWith =>
      __$$LibraryLoadedImplCopyWithImpl<_$LibraryLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(
        featuredBooks, downloadedFiles, downloadProgress, activeDownloads);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(
        featuredBooks, downloadedFiles, downloadProgress, activeDownloads);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          featuredBooks, downloadedFiles, downloadProgress, activeDownloads);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LibraryInitial value) initial,
    required TResult Function(LibraryLoading value) loading,
    required TResult Function(LibraryLoaded value) loaded,
    required TResult Function(LibraryError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibraryInitial value)? initial,
    TResult? Function(LibraryLoading value)? loading,
    TResult? Function(LibraryLoaded value)? loaded,
    TResult? Function(LibraryError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibraryInitial value)? initial,
    TResult Function(LibraryLoading value)? loading,
    TResult Function(LibraryLoaded value)? loaded,
    TResult Function(LibraryError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LibraryLoaded implements LibraryState {
  const factory LibraryLoaded(
      {required final List<Book> featuredBooks,
      required final List<DownloadedFile> downloadedFiles,
      final Map<String, double> downloadProgress,
      final Set<String> activeDownloads}) = _$LibraryLoadedImpl;

  List<Book> get featuredBooks;
  List<DownloadedFile> get downloadedFiles;
  Map<String, double> get downloadProgress;
  Set<String> get activeDownloads;
  @JsonKey(ignore: true)
  _$$LibraryLoadedImplCopyWith<_$LibraryLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LibraryErrorImplCopyWith<$Res> {
  factory _$$LibraryErrorImplCopyWith(
          _$LibraryErrorImpl value, $Res Function(_$LibraryErrorImpl) then) =
      __$$LibraryErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LibraryErrorImplCopyWithImpl<$Res>
    extends _$LibraryStateCopyWithImpl<$Res, _$LibraryErrorImpl>
    implements _$$LibraryErrorImplCopyWith<$Res> {
  __$$LibraryErrorImplCopyWithImpl(
      _$LibraryErrorImpl _value, $Res Function(_$LibraryErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LibraryErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LibraryErrorImpl implements LibraryError {
  const _$LibraryErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'LibraryState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryErrorImplCopyWith<_$LibraryErrorImpl> get copyWith =>
      __$$LibraryErrorImplCopyWithImpl<_$LibraryErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Book> featuredBooks,
            List<DownloadedFile> downloadedFiles,
            Map<String, double> downloadProgress,
            Set<String> activeDownloads)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LibraryInitial value) initial,
    required TResult Function(LibraryLoading value) loading,
    required TResult Function(LibraryLoaded value) loaded,
    required TResult Function(LibraryError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LibraryInitial value)? initial,
    TResult? Function(LibraryLoading value)? loading,
    TResult? Function(LibraryLoaded value)? loaded,
    TResult? Function(LibraryError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LibraryInitial value)? initial,
    TResult Function(LibraryLoading value)? loading,
    TResult Function(LibraryLoaded value)? loaded,
    TResult Function(LibraryError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LibraryError implements LibraryState {
  const factory LibraryError({required final String message}) =
      _$LibraryErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$LibraryErrorImplCopyWith<_$LibraryErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
