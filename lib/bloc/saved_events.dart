import 'package:equatable/equatable.dart';
import 'package:flutter_app/model/count.dart';

abstract class SavedEvents extends Equatable {
  const SavedEvents();

  @override
  List<Object?> get props => [];
}

class SaveNewCount extends SavedEvents {
  final Count _count;

  const SaveNewCount(this._count);

  Count get count => _count;

  @override
  List<Object?> get props => [_count];
}