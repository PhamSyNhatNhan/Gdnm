import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../class/Dish.dart';
import '../class/DishImage.dart';
import '../dummy/DishDummy.dart';
import '../main.dart';
import '../widget/SavedRecipesCard.dart';

class ActivityMat extends StatefulWidget {
  @override
  State<ActivityMat> createState() => _ActivityMat();
}

class _ActivityMat extends State<ActivityMat> {
  final List<Dish> _dishListOwner = [];
  final List<Dish> _dishListHistory = [];
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    try {
      List<Dish> tempList = List.from(dummyDishes);
      tempList.shuffle();
      _dishListOwner.addAll(tempList.take(5));

      // Lấy ngẫu nhiên 5 món khác cho phần lịch sử
      tempList.shuffle();
      _dishListHistory.addAll(tempList.take(5));

      setState(() {
        _isLoaded = true;
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
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Bình luận',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            Container(
              height: 100,
              child: Center(
                child:  Text(
                  'Tính năng đang được phát triển',
                  style: TextStyle(
                    fontSize: 17,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 25,
            ),

            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Công thức',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            if(_isLoaded)
              Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for(int i = 0; i < _dishListOwner.length; i++)
                            SavedRecipesCard(
                                dish_: _dishListOwner[i], cardWeight: MediaQuery.of(context).size.width * 0.4
                            )
                        ],
                      ),
                    ),
                  )
              ),

            SizedBox(
              height: 25,
            ),

            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lịch sử',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            if(_isLoaded)
              Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for(int i = 0; i < _dishListHistory.length; i++)
                            SavedRecipesCard(
                                dish_: _dishListHistory[i], cardWeight: MediaQuery.of(context).size.width * 0.4
                            )
                        ],
                      ),
                    ),
                  )
              ),
          ]
      ),
    );
  }
}

