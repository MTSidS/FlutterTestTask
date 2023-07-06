Code Review Pointers:

1. As ListItemWidget is a stateful widget any same value given to number of this widget will have state duplication, so we should put key to this widget like below:
   ListItemWidget(key: ValueKey(index))
2. for (var i = 0; i <= 100; i++) {
     list.add(ListItemWidget());
   } 
   Should not do logic like for loop on build method, so remove above code from build method 
3. var list = <Widget>[];
   for (var i = 0; i <= 100; i++) {
     list.add(ListItemWidget());
   }
   Instead of using above lines better way of doing this would be:
   var list = List.filled(100, ListItemWidget());
4. instead of using var we should use actual return type to make it cleaner, so
   var list = List.filled(100, ListItemWidget());
   should be 
   List<Widget> list = List.filled(100, ListItemWidget());
5. We are using the same ListItemWidget everywhere so we don't need to add it into List<Widget>, rather we can use List<int> as it will consumer lesser memory
   so, we can do : List<int> list = List.filled(100, 0);
6. setState() is used in ListItemWidget, which can make unnecessary rebuilds, so we need a proper state management solution such as BLoC.
7. Container is used in ListItemWidget, but none of the properties are used except for padding, which makes Container redundant as we can achieve the same just using Padding widget.
8. Name of the List<Widget> is list, which should be changed to something meaningful like counts.
9. ListWidget and ListItemWidget should be taken into a separate files.
10. ListWidget and ListItemWidget should be renamed to CounterWidget and CounterItemWidget respectively for meaningful names.