import 'package:flutter_app/bloc/counter_events.dart';
import 'package:flutter_app/bloc/counter_states.dart';
import 'package:flutter_app/model/count.dart';
import 'package:flutter_app/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {

  final Repository _repository;

  CounterBloc(this._repository) : super(InitialState(0));

  @override
  Stream<CounterStates> mapEventToState(CounterEvents event) async* {
    if (event is IncreaseCounter) {
      yield* _mapIncreaseCounterToState();
    } else if (event is DecreaseCounter) {
      yield* _mapDecreaseCounterToState();
    }
  }

  Stream<CounterStates> _mapIncreaseCounterToState() async* {
    yield LoadingState();
    try {
      final result = await _repository.increaseCount();
      yield CountState(Count(result));
    } catch (e) {
      yield ErrorState(e.toString());
    }
  }

  Stream<CounterStates> _mapDecreaseCounterToState() async* {
    yield LoadingState();
    try {
      final result = await _repository.decreaseCount();
      yield CountState(Count(result));
    } catch (e) {
      yield ErrorState(e.toString());
    }
  }
}
