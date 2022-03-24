import 'package:equatable/equatable.dart';

class DataState<T, Error> extends Equatable {
  final bool isInProgress;
  final bool isInAgainProgress;
  final bool isFailure;
  final bool isInternetError;
  final bool isSuccess;
  final bool isEmpty;
  final T? data;
  final Error? error;

  const DataState({
    this.isInProgress = false,
    this.isInAgainProgress = false,
    this.isFailure = false,
    this.isInternetError = false,
    this.isSuccess = false,
    this.isEmpty = false,
    this.data,
    this.error,
  });

  DataState<T, Error> copyWith({
    final bool? isInProgress,
    final bool? isInAgainProgress,
    final bool? isFailure,
    final bool? isInternetError,
    final bool? isSuccess,
    final bool? isEmpty,
    final T? data,
    final Error? error,
  }) {
    return DataState(
      isInProgress: isInProgress ?? false,
      isInAgainProgress: isInAgainProgress ?? false,
      isFailure: isFailure ?? false,
      isInternetError: isInternetError ?? false,
      isSuccess: isSuccess ?? false,
      isEmpty: isEmpty ?? false,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        isInAgainProgress,
        isInAgainProgress,
        isFailure,
        isInternetError,
        isSuccess,
        isEmpty,
        error,
        data,
      ];

  @override
  bool? get stringify => true;
}
