import 'package:equatable/equatable.dart';
import 'package:flutter_app/model/count.dart';

abstract class CounterStates extends Equatable {

  const CounterStates();

  @override
  List<Object?> get props => [];
}

class InitialState extends CounterStates {
  final int _count;

  const InitialState(this._count);

  int get count => _count;

  @override
  List<Object?> get props => [_count];
}

class LoadingState extends CounterStates {}

class CountState extends CounterStates {
  final Count _count;

  const CountState(Count count) : _count = count;

  Count get count => _count;

  @override
  List<Object?> get props => [_count];
}

class ErrorState extends CounterStates {
  final String? _message;

  const ErrorState(String? message): _message = message;

  String? get message => _message;

  @override
  List<Object?> get props => [_message];
}