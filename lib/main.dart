import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/count_bloc.dart';
import 'bloc/count_event.dart';
import 'bloc/count_state.dart';

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
          child: const ListWidget(),
        ),
      ),
    );
  }
}

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountItemBloc, CountItemState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.counts.length,
          itemBuilder: (context, index) {
            return ListItemWidget(
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

class ListItemWidget extends StatefulWidget {
  final int count;
  final int index;

  const ListItemWidget({super.key, required this.count, required this.index});

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
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
