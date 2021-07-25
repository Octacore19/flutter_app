import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/counter_bloc.dart';
import 'package:flutter_app/bloc/counter_events.dart';
import 'package:flutter_app/bloc/counter_states.dart';
import 'package:flutter_app/pages/saved.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CounterBloc _bloc;

  int _count = 0;

  @override
  void initState() {
    _bloc = BlocProvider.of<CounterBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterBloc, CounterStates>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is ErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message!)));
          }
          if (state is CountState) {
            _count = state.count.count;
          }
        },
        child: BlocBuilder(
          bloc: _bloc,
          builder: (_, state) {
            return Column(
              children: [
                SizedBox(height: 24.0),
                _displayResult(),
                SizedBox(height: 16.0),
                _increaseButton(),
                SizedBox(height: 16.0),
                _decreaseButton(),
                SizedBox(height: 16.0),
                _nextButton(),
              ],
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _increaseButton() {
    return ElevatedButton(
      onPressed: () {
        _bloc.add(IncreaseCounter());
      },
      child: Text('Increase'),
    );
  }

  Widget _decreaseButton() {
    return ElevatedButton(
      onPressed: () {
        _bloc.add(DecreaseCounter());
      },
      child: Text('Decrease'),
    );
  }

  Widget _nextButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SavedCountsPage()));
      },
      child: Text('Next'),
    );
  }

  Widget _displayResult() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          SizedBox(height: 16.0),
          BlocBuilder(
            builder: (_, state) {
              if (state is LoadingState) {
                return CircularProgressIndicator();
              }
              return Text(
                _count.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            },
            bloc: _bloc,
          ),
        ],
      ),
    );
  }
}