part of 'counter_cubit_cubit.dart';

enum CounterStatus { initial, loading, done, fail }

class CounterState extends Equatable {
  late final int? value;
  late final CounterStatus? status;
  late final String? errorMessage;
  CounterState({this.value, this.errorMessage, this.status});

  CounterState.initial() {
    value = 0;
    status = CounterStatus.initial;
    errorMessage = "";
  }
  CounterState copyWith({
    int? value,
    CounterStatus? status,
    String? errorMessage,
  }) {
    return CounterState(
      value: value ?? this.value,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        value,
      ];
}
