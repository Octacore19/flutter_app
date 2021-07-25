import 'package:equatable/equatable.dart';

abstract class CounterEvents extends Equatable {
  const CounterEvents();

  @override
  List<Object?> get props => [];
}

class IncreaseCounter extends CounterEvents {}

class DecreaseCounter extends CounterEvents {}