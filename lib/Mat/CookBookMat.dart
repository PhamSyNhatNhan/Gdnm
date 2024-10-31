import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../dummy/DishDummy.dart';
import '../main.dart';

class CookbookMat extends StatefulWidget {
  @override
  State<CookbookMat> createState() => _CookbookMat();
}

class DishCategory {
  String idCategory;
  String nameCategory;
  String dishNumber;
  String cateImage;

  DishCategory(this.idCategory, this.nameCategory, this.dishNumber, this.cateImage);
}

class _CookbookMat extends State<CookbookMat> {
  final List<DishCategory> _listCate = [];
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _getCateList();
  }

  Future<void> _getCateList() async {
    try {
      // Tạo danh sách category mẫu
      List<DishCategory> categories = [
        DishCategory("C1", "Món Việt", "12", dummyDishes[0].dishImages[0].dishImage),
        DishCategory("C2", "Món Á", "8", dummyDishes[1].dishImages[0].dishImage),
        DishCategory("C3", "Món Âu", "5", dummyDishes[2].dishImages[0].dishImage),
        DishCategory("C4", "Món Chay", "7", dummyDishes[3].dishImages[0].dishImage),
        DishCategory("C5", "Món Tráng Miệng", "4", dummyDishes[4].dishImages[0].dishImage),
      ];

      _listCate.addAll(categories);

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
            if(_isLoaded)
              for(var i = 0; i < _listCate.length; i++)
                Container(
                    child: InkWell(
                      onTap: (){

                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 0, right: 20, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image.network(
                                _listCate[i].cateImage == '' ? 'https://static.wikia.nocookie.net/gochiusa/images/1/18/Tippy.png/revision/latest?cb=20160203062255' : _listCate[i].cateImage,
                                width: MediaQuery.of(context).size.width * 0.35,
                                height: MediaQuery.of(context).size.width * 0.2,
                                fit: BoxFit.cover,
                              ),
                            ),

                            SizedBox(
                              width: 20,
                            ),

                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _listCate[i].nameCategory,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),

                                  Text(
                                    _listCate[i].dishNumber + " công thức",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
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