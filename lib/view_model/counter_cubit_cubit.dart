import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sample/model/repository/repo.dart';
//view - viewmodel -repository -model(model,remote,local,3rd...)
part 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());
  //reposiotry
  final instance = repository();
  void increase() async {
    emit(state.copyWith(status: CounterStatus.loading));
    final response = instance.getData();
    emit(
      state.copyWith(value: response, status: CounterStatus.done),
    );
  }

  void showSnackBar(BuildContext context, String content) {
    final snackBar = SnackBar(
      content: Text(state.errorMessage ?? ""),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void makeError(String error) {
    emit(state.copyWith(errorMessage: "error", status: CounterStatus.fail));
    emit(state.copyWith(status: CounterStatus.initial, errorMessage: ""));
  }
}
