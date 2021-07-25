import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/saved_bloc.dart';
import 'package:flutter_app/bloc/saved_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedCountsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SavedCountsPageState();
}

class _SavedCountsPageState extends State<SavedCountsPage> {
  late SavedBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<SavedBloc>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Counts'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: BlocBuilder(
          bloc: _bloc,
          builder: (_, state) {
            if (state is FilledSavedList) {
              return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (_, i) => ListTile(
                  leading: Text((i + 1).toString()),
                  title: Text(state.list[i].count.toString()),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
