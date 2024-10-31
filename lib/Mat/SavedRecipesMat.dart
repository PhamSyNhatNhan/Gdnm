import 'package:flutter/material.dart';
import '../class/Dish.dart';
import '../dummy/DishDummy.dart';
import '../main.dart';
import '../widget/SavedRecipesCard.dart';

class SavedRecipesMat extends StatefulWidget {
  @override
  State<SavedRecipesMat> createState() => _SavedRecipesMat();
}

class _SavedRecipesMat extends State<SavedRecipesMat> {
  final List<Dish> _dishList = [];
  bool _isDishListLoaded = false;

  @override
  void initState() {
    super.initState();
    _getDishList();
  }

  Future<void> _getDishList() async {
    try {
      List<Dish> tempList = List.from(dummyDishes);
      tempList.shuffle();
      _dishList.addAll(tempList.take(10));

      setState(() {
        _isDishListLoaded = true;
      });
    } catch(e) {
      print('Có lỗi: ' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),

          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: (){

              },
              child: Stack(
                children: [
                  Positioned(
                    top: 7,
                    left: 10,
                    child: Icon(
                      Icons.search_outlined,
                      size: 23,
                    ),
                  ),

                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: Center(
                      child: Text(
                        'Tìm kiếm công thức đã lưu',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.withOpacity(0.7)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 15,
          ),

          if (_isDishListLoaded)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < _dishList.length; i+=2)
                        SavedRecipesCard(
                          dish_: _dishList[i],
                          cardWeight: MediaQuery.of(context).size.width * 0.42,
                        )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (var i = 1; i < _dishList.length; i+=2)
                        SavedRecipesCard(
                          dish_: _dishList[i],
                          cardWeight: MediaQuery.of(context).size.width * 0.42,
                        )
                    ],
                  ),
                )
              ],
            ),
          if (!_isDishListLoaded)
            CircularProgressIndicator(),
        ],
      ),
    );
  }
}