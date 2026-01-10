// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookDto _$BookDtoFromJson(Map<String, dynamic> json) {
  return _BookDto.fromJson(json);
}

/// @nodoc
mixin _$BookDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get downloadUrl => throw _privateConstructorUsedError;
  String get fileType => throw _privateConstructorUsedError;
  int? get fileSizeBytes => throw _privateConstructorUsedError;
  String? get publishedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookDtoCopyWith<BookDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDtoCopyWith<$Res> {
  factory $BookDtoCopyWith(BookDto value, $Res Function(BookDto) then) =
      _$BookDtoCopyWithImpl<$Res, BookDto>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? thumbnailUrl,
      String? author,
      String? description,
      String downloadUrl,
      String fileType,
      int? fileSizeBytes,
      String? publishedDate});
}

/// @nodoc
class _$BookDtoCopyWithImpl<$Res, $Val extends BookDto>
    implements $BookDtoCopyWith<$Res> {
  _$BookDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumbnailUrl = freezed,
    Object? author = freezed,
    Object? description = freezed,
    Object? downloadUrl = null,
    Object? fileType = null,
    Object? fileSizeBytes = freezed,
    Object? publishedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      fileSizeBytes: freezed == fileSizeBytes
          ? _value.fileSizeBytes
          : fileSizeBytes // ignore: cast_nullable_to_non_nullable
              as int?,
      publishedDate: freezed == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookDtoImplCopyWith<$Res> implements $BookDtoCopyWith<$Res> {
  factory _$$BookDtoImplCopyWith(
          _$BookDtoImpl value, $Res Function(_$BookDtoImpl) then) =
      __$$BookDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? thumbnailUrl,
      String? author,
      String? description,
      String downloadUrl,
      String fileType,
      int? fileSizeBytes,
      String? publishedDate});
}

/// @nodoc
class __$$BookDtoImplCopyWithImpl<$Res>
    extends _$BookDtoCopyWithImpl<$Res, _$BookDtoImpl>
    implements _$$BookDtoImplCopyWith<$Res> {
  __$$BookDtoImplCopyWithImpl(
      _$BookDtoImpl _value, $Res Function(_$BookDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumbnailUrl = freezed,
    Object? author = freezed,
    Object? description = freezed,
    Object? downloadUrl = null,
    Object? fileType = null,
    Object? fileSizeBytes = freezed,
    Object? publishedDate = freezed,
  }) {
    return _then(_$BookDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      fileSizeBytes: freezed == fileSizeBytes
          ? _value.fileSizeBytes
          : fileSizeBytes // ignore: cast_nullable_to_non_nullable
              as int?,
      publishedDate: freezed == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookDtoImpl extends _BookDto {
  const _$BookDtoImpl(
      {required this.id,
      required this.title,
      this.thumbnailUrl,
      this.author,
      this.description,
      required this.downloadUrl,
      required this.fileType,
      this.fileSizeBytes,
      this.publishedDate})
      : super._();

  factory _$BookDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? thumbnailUrl;
  @override
  final String? author;
  @override
  final String? description;
  @override
  final String downloadUrl;
  @override
  final String fileType;
  @override
  final int? fileSizeBytes;
  @override
  final String? publishedDate;

  @override
  String toString() {
    return 'BookDto(id: $id, title: $title, thumbnailUrl: $thumbnailUrl, author: $author, description: $description, downloadUrl: $downloadUrl, fileType: $fileType, fileSizeBytes: $fileSizeBytes, publishedDate: $publishedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.fileSizeBytes, fileSizeBytes) ||
                other.fileSizeBytes == fileSizeBytes) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, thumbnailUrl, author,
      description, downloadUrl, fileType, fileSizeBytes, publishedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookDtoImplCopyWith<_$BookDtoImpl> get copyWith =>
      __$$BookDtoImplCopyWithImpl<_$BookDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookDtoImplToJson(
      this,
    );
  }
}

abstract class _BookDto extends BookDto {
  const factory _BookDto(
      {required final String id,
      required final String title,
      final String? thumbnailUrl,
      final String? author,
      final String? description,
      required final String downloadUrl,
      required final String fileType,
      final int? fileSizeBytes,
      final String? publishedDate}) = _$BookDtoImpl;
  const _BookDto._() : super._();

  factory _BookDto.fromJson(Map<String, dynamic> json) = _$BookDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get thumbnailUrl;
  @override
  String? get author;
  @override
  String? get description;
  @override
  String get downloadUrl;
  @override
  String get fileType;
  @override
  int? get fileSizeBytes;
  @override
  String? get publishedDate;
  @override
  @JsonKey(ignore: true)
  _$$BookDtoImplCopyWith<_$BookDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeaturedBooksResponse _$FeaturedBooksResponseFromJson(
    Map<String, dynamic> json) {
  return _FeaturedBooksResponse.fromJson(json);
}

/// @nodoc
mixin _$FeaturedBooksResponse {
  List<BookDto> get books => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeaturedBooksResponseCopyWith<FeaturedBooksResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeaturedBooksResponseCopyWith<$Res> {
  factory $FeaturedBooksResponseCopyWith(FeaturedBooksResponse value,
          $Res Function(FeaturedBooksResponse) then) =
      _$FeaturedBooksResponseCopyWithImpl<$Res, FeaturedBooksResponse>;
  @useResult
  $Res call({List<BookDto> books});
}

/// @nodoc
class _$FeaturedBooksResponseCopyWithImpl<$Res,
        $Val extends FeaturedBooksResponse>
    implements $FeaturedBooksResponseCopyWith<$Res> {
  _$FeaturedBooksResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
  }) {
    return _then(_value.copyWith(
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<BookDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeaturedBooksResponseImplCopyWith<$Res>
    implements $FeaturedBooksResponseCopyWith<$Res> {
  factory _$$FeaturedBooksResponseImplCopyWith(
          _$FeaturedBooksResponseImpl value,
          $Res Function(_$FeaturedBooksResponseImpl) then) =
      __$$FeaturedBooksResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BookDto> books});
}

/// @nodoc
class __$$FeaturedBooksResponseImplCopyWithImpl<$Res>
    extends _$FeaturedBooksResponseCopyWithImpl<$Res,
        _$FeaturedBooksResponseImpl>
    implements _$$FeaturedBooksResponseImplCopyWith<$Res> {
  __$$FeaturedBooksResponseImplCopyWithImpl(_$FeaturedBooksResponseImpl _value,
      $Res Function(_$FeaturedBooksResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
  }) {
    return _then(_$FeaturedBooksResponseImpl(
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<BookDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeaturedBooksResponseImpl implements _FeaturedBooksResponse {
  const _$FeaturedBooksResponseImpl({required final List<BookDto> books})
      : _books = books;

  factory _$FeaturedBooksResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeaturedBooksResponseImplFromJson(json);

  final List<BookDto> _books;
  @override
  List<BookDto> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  String toString() {
    return 'FeaturedBooksResponse(books: $books)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeaturedBooksResponseImpl &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeaturedBooksResponseImplCopyWith<_$FeaturedBooksResponseImpl>
      get copyWith => __$$FeaturedBooksResponseImplCopyWithImpl<
          _$FeaturedBooksResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeaturedBooksResponseImplToJson(
      this,
    );
  }
}

abstract class _FeaturedBooksResponse implements FeaturedBooksResponse {
  const factory _FeaturedBooksResponse({required final List<BookDto> books}) =
      _$FeaturedBooksResponseImpl;

  factory _FeaturedBooksResponse.fromJson(Map<String, dynamic> json) =
      _$FeaturedBooksResponseImpl.fromJson;

  @override
  List<BookDto> get books;
  @override
  @JsonKey(ignore: true)
  _$$FeaturedBooksResponseImplCopyWith<_$FeaturedBooksResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
