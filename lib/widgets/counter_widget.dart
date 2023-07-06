import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/count_bloc.dart';
import '../bloc/count_state.dart';
import 'counter_item_widget.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountItemBloc, CountItemState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.counts.length,
          itemBuilder: (context, index) {
            return CounterItemWidget(
              key: ValueKey(index),
              count: state.counts[index],
              index: index,
            );
          },
        );
      },
    );
  }
}