// Result wrapper for success/failure handling.

import 'failure.dart';

sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isError => this is Error<T>;

  T? get valueOrNull => switch (this) {
    Success<T>(:final value) => value,
    Error<T>() => null,
  };

  Failure? get failureOrNull => switch (this) {
    Success<T>() => null,
    Error<T>(:final failure) => failure,
  };

  Result<R> map<R>(R Function(T value) mapper) => switch (this) {
    Success<T>(:final value) => Success(mapper(value)),
    Error<T>(:final failure) => Error(failure),
  };

  Result<R> flatMap<R>(Result<R> Function(T value) mapper) => switch (this) {
    Success<T>(:final value) => mapper(value),
    Error<T>(:final failure) => Error(failure),
  };

  R fold<R>({
    required R Function(T value) onSuccess,
    required R Function(Failure failure) onError,
  }) => switch (this) {
    Success<T>(:final value) => onSuccess(value),
    Error<T>(:final failure) => onError(failure),
  };

  T getOrThrow() => switch (this) {
    Success<T>(:final value) => value,
    Error<T>(:final failure) => throw Exception(failure.message),
  };

  T getOrElse(T defaultValue) => switch (this) {
    Success<T>(:final value) => value,
    Error<T>() => defaultValue,
  };
}

final class Success<T> extends Result<T> {
  final T value;

  const Success(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Success<T> && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Success($value)';
}

final class Error<T> extends Result<T> {
  final Failure failure;

  const Error(this.failure);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Error<T> && failure == other.failure;

  @override
  int get hashCode => failure.hashCode;

  @override
  String toString() => 'Error($failure)';
}
