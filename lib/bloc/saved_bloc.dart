import 'dart:async';

import 'package:flutter_app/bloc/counter_bloc.dart';
import 'package:flutter_app/bloc/counter_states.dart';
import 'package:flutter_app/bloc/saved_events.dart';
import 'package:flutter_app/bloc/saved_states.dart';
import 'package:flutter_app/model/count.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedBloc extends Bloc<SavedEvents, SavedStates> {
  final CounterBloc _counterBloc;
  late StreamSubscription _counterSub;

  SavedBloc(this._counterBloc) : super(EmptySavedList()) {
    _counterSub = _counterBloc.stream.listen((event) {
      if (event is CountState) {
        final newCount = event.count;
        if (_counts.isEmpty) {
          add(SaveNewCount(newCount));
        } else {
          final lastCount = _counts.last;
          if (_calculateDifference(lastCount.timeStamp, newCount.timeStamp)) {
            add(SaveNewCount(newCount));
          }
        }
      }
    });
  }

  List<Count> _counts = [];

  @override
  Stream<SavedStates> mapEventToState(SavedEvents event) async* {
    if (event is SaveNewCount) {
      _counts.add(event.count);
      yield FilledSavedList(_counts);
    }
  }

  _calculateDifference(int pre, int suf) {
    final newTime = DateTime.fromMillisecondsSinceEpoch(suf).second;
    final preTime = DateTime.fromMillisecondsSinceEpoch(pre).second;
    return ((preTime - newTime) >= 5 );
  }

  @override
  Future<void> close() {
    _counterSub.cancel();
    return super.close();
  }
}