import 'package:flutter_bloc/flutter_bloc.dart';
import 'count_event.dart';
import 'count_state.dart';

class CountItemBloc extends Bloc<CountItemEvent, CountItemState> {
  CountItemBloc() : super(CountItemState(List.filled(100, 0))) {
    on<IncrementCount>((event, emit) {
      final newCounts = List<int>.from(state.counts);
      newCounts[event.index]++;
      emit(CountItemState(newCounts));
    });
  }
}