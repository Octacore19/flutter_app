import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/counter_bloc.dart';
import 'package:flutter_app/bloc/saved_bloc.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => CounterBloc(Repository()),
      ),
      BlocProvider(
        create: (_) => SavedBloc(BlocProvider.of<CounterBloc>(_)),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}