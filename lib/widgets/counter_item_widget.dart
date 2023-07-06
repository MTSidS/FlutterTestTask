import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/count_bloc.dart';
import '../bloc/count_event.dart';

class CounterItemWidget extends StatefulWidget {
  final int count;
  final int index;

  const CounterItemWidget({super.key, required this.count, required this.index});

  @override
  State<CounterItemWidget> createState() => _CounterItemWidgetState();
}

class _CounterItemWidgetState extends State<CounterItemWidget> {
  late final bloc;

  @override
  void initState() {
    bloc = context.read<CountItemBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.count.toString(),
            style: const TextStyle(fontSize: 20),
          ),
          MaterialButton(
            onPressed: () {
              bloc.add(IncrementCount(widget.index));
            },
            child: const Text(
              "+",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}