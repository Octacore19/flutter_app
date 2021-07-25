import 'package:equatable/equatable.dart';
import 'package:flutter_app/model/count.dart';

abstract class SavedStates extends Equatable {
  const SavedStates();
  @override
  List<Object?> get props => [];
}

class EmptySavedList extends SavedStates {}

class FilledSavedList extends SavedStates {
  final List<Count> _list;

  const FilledSavedList(this._list);

  List<Count> get list => _list;

  @override
  List<Object?> get props => [_list];
}