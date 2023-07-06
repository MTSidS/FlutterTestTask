import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_functional_task/widgets/counter_widget.dart';

import 'bloc/count_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider<CountItemBloc>(
          create: (context) => CountItemBloc(),
          child: const CounterWidget(),
        ),
      ),
    );
  }
}
