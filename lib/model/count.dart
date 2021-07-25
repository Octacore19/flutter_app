import 'package:equatable/equatable.dart';

class Count extends Equatable {
  final int _count;
  final int _timeStamp;

  Count(this._count): _timeStamp = DateTime.now().millisecondsSinceEpoch;

  int get count => _count;

  int get timeStamp => _timeStamp;

  @override
  List<Object?> get props => [_count, _timeStamp];
}