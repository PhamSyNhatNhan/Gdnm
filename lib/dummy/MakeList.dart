import 'dart:math';
import 'package:shimmerai/class/Dish.dart';

import 'DishDummy.dart';

class MakeList {
  String _title;
  List<Dish> _list = [];

  MakeList(this._title) {
    _list = _generateRandomList();
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  List<Dish> get list => _list;

  set list(List<Dish> value) {
    _list = value;
  }

  List<Dish> _generateRandomList() {
    List<Dish> tempList = List.from(dummyDishes);
    List<Dish> randomList = [];
    Random random = Random();

    int itemsToSelect = min(10, tempList.length);

    for (int i = 0; i < itemsToSelect; i++) {
      int randomIndex = random.nextInt(tempList.length);

      randomList.add(tempList[randomIndex]);

      tempList.removeAt(randomIndex);
    }

    return randomList;
  }

  void regenerateList() {
    _list = _generateRandomList();
  }

  int getTotalCookingTime() {
    return _list.fold(0, (sum, dish) =>
    sum + int.parse(dish.dishTimeCook) + int.parse(dish.dishTimePrepare));
  }

  Dish? getMostLikedDish() {
    if (_list.isEmpty) return null;

    return _list.reduce((curr, next) =>
    int.parse(curr.dishUp) > int.parse(next.dishUp) ? curr : next);
  }

  bool isEmpty() {
    return _list.isEmpty;
  }

  int size() {
    return _list.length;
  }
}