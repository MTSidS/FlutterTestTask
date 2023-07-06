
class CountItemEvent {}

class IncrementCount extends CountItemEvent {
  final int index;

  IncrementCount(this.index);
}