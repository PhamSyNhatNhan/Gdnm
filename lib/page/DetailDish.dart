import 'package:flutter/material.dart';

import '../class/DataDummyHelper.dart';
import '../class/Dish.dart';
import '../class/DishComment.dart';
import '../class/DishMaterial.dart';
import '../class/DishStep.dart';

class DetailDish extends StatefulWidget {
  final Dish dishTmp;
  const DetailDish({Key? key, required this.dishTmp}) : super(key: key);

  @override
  State<DetailDish> createState() => _DetailDish();
}

class _DetailDish extends State<DetailDish> {
  bool _isDishLoaded = false;
  bool _isFavor = false;
  bool _isOwner = false;
  int _currentIndex = 0;
  int _currentServing = 1;
  List<DishMaterial> _listMaterial = [];
  List<DishStep> _listSteps = [];
  List<DishComment> _listComments = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    try {
      _listMaterial = DummyDataHelper.getMaterials(widget.dishTmp.dishId);
      _listSteps = DummyDataHelper.getSteps(widget.dishTmp.dishId);
      _listComments = DummyDataHelper.getComments(widget.dishTmp.dishId);

      _isDishLoaded = true;
      _isFavor = false;
      _isOwner = false;

      setState(() {});
    } catch(e) {
      print('Có lỗi: ' + e.toString());
    }
  }

  Future<void> _changeFavor() async {
    if(_isOwner) return;

    setState(() {
      _isFavor = !_isFavor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(top: 0, left: 0, bottom: 0, right: 0),
              child: Column(
                children: [
                  Container(
                    //color: Colors.blue,
                    height: 60,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 12,
                            left: 7,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 30,
                              ),
                            )
                        ),

                        if (_isDishLoaded)
                          Positioned(
                              top: 12,
                              right: 7,
                              child: IconButton(
                                onPressed: () {
                                  _changeFavor();
                                },
                                icon: Icon(
                                  _isFavor == true ? Icons.favorite : Icons.favorite_border,
                                  size: 30,
                                  color: Colors.pinkAccent,
                                ),
                              )
                          ),
                        if (!_isDishLoaded)
                          Positioned(
                              top: 12,
                              right: 7,
                              child: IconButton(
                                onPressed: () {

                                },
                                icon: Icon(
                                  Icons.favorite_border,
                                  size: 30,
                                ),
                              )
                          ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 0, bottom: 20, left: 20, right: 20),
                    child: Column(
                      children: [
                        Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.dishTmp.dishName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27,

                                ),
                              ),
                            )
                        ),

                        SizedBox(
                          height: 5,
                        ),

                        Container(
                          child: Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.dishTmp.dishDecription,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                          ),
                        ),

                        SizedBox(
                          height: 15,
                        ),

                        Container(
                          child: Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_outlined,
                                        size: 22,
                                      ),
                                      Text(
                                        ' Sẵn sàng trong ',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        (double.parse(widget.dishTmp.dishTimePrepare) + double.parse(widget.dishTmp.dishTimeCook)).toString() + " phút",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  )
                              )
                          ),
                        ),

                        SizedBox(height: 10,),

                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 10),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 0, left: 0, bottom: 0, right: 0),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        widget.dishTmp.dishImages.isNotEmpty
                                            ? widget.dishTmp.dishImages[_currentIndex].dishImage
                                            : 'https://static.wikia.nocookie.net/gochiusa/images/1/18/Tippy.png/revision/latest?cb=20160203062255',
                                        fit: BoxFit.cover,
                                        width: MediaQuery.of(context).size.width - 60,
                                        height: MediaQuery.of(context).size.width - 60,
                                      ),
                                    ),
                                  ),
                                ),

                                if(widget.dishTmp.dishImages.length > 1)
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width - 60,
                                    height: MediaQuery.of(context).size.width - 60,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: (MediaQuery.of(context).size.width - 60) * 0.45,
                                          left: 0,
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _currentIndex = _currentIndex > 0 ? _currentIndex - 1 : _currentIndex;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.arrow_back_ios_new_rounded,
                                              size: 30,
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          top: (MediaQuery.of(context).size.width - 60) * 0.45,
                                          right: 0,
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _currentIndex = _currentIndex < (widget.dishTmp.dishImages.length - 1) ? _currentIndex + 1 : _currentIndex;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 150,
                                      child: Text(
                                        'Nguyên liêu cho',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child:  Row(
                                          children: [
                                            Text(
                                              _currentServing.toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              ' phần',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),

                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 5, right: 5),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _currentServing = _currentServing > 1 ? _currentServing - 1 : _currentServing;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          size: 20,
                                        ),
                                      ),
                                    ),

                                    Text(
                                      _currentServing.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(left: 5, right: 5),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _currentServing += 1;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),

                        Container(
                          child: Column(
                            children: [
                              for(int i = 0; i < _listMaterial.length; i++)
                                Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                _listMaterial[i].dishMaterialName,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                (double.parse(_listMaterial[i].dishMaterialMass) * _currentServing).toString() + ' gam',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Container(
                                          height: 2,
                                        ),
                                      ],
                                    )
                                ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Giá trị dinh dưỡng',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      child: InkWell(
                                        onTap: (){
                                          print('Chức năng đang được phát triển');
                                        },
                                        child: Text(
                                          'View Info +',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 15,
                                ),

                                Container(
                                  height: 2,
                                )
                              ],
                            )
                        ),

                        SizedBox(
                          height: 25,
                        ),

                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Bình luận' ,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),

                                        Text(
                                          ' (' + _listComments.length.toString() + ')' ,
                                          style: TextStyle(
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),

                              SizedBox(
                                height: 25,
                              ),

                              if(_isDishLoaded && !_listComments.isEmpty)
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(50), // Độ cong của góc
                                            child: Image.network(
                                              _listComments[0].userImage == '' ? 'https://static.wikia.nocookie.net/gochiusa/images/1/18/Tippy.png/revision/latest?cb=20160203062255' : _listComments[0].userImage,
                                              fit: BoxFit.cover,
                                              width: MediaQuery.of(context).size.width * 0.15,
                                              height: MediaQuery.of(context).size.width * 0.15,
                                            ),
                                          ),

                                          SizedBox(width: 10,),

                                          Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _listComments[0].userName,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                Text(
                                                  _listComments[0].dishCommentDay,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          _listComments[0].dishComment,
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),


                              SizedBox(
                                height: 25,
                              ),

                              if(_isDishLoaded && !_listComments.isEmpty)
                                Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        onTap: (){
                                          /*
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CommentPage(
                                                listComments: _listComments,
                                              ),
                                            ),
                                          );
                                         TODO lam gi do
                                           */
                                        },
                                        child: Text(
                                          'Xem tất cả bình luận >',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    )
                                ),

                              if(_isDishLoaded && _listComments.isEmpty)
                                Container(
                                    child: Center(
                                      child: Text(
                                        'Chưa có bình luận',
                                        style: TextStyle(
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    )
                                ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 25,
                        ),

                        /*
                        Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2, // Độ dày của viền
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),

                            child: InkWell(
                              onTap: (){

                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 12, bottom: 12,),
                                child: Center(
                                  child: Text(
                                    'Nhonn!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),

                         */

                        SizedBox(
                          height: 0,
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Container(
                                  child:  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Thời gian chuẩn bị',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  )
                              ),

                              SizedBox(
                                height: 10,
                              ),

                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.29,
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Thời gian',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),

                                          SizedBox(
                                            height: 5,
                                          ),

                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              (double.parse(widget.dishTmp.dishTimeCook) + double.parse(widget.dishTmp.dishTimePrepare)).toString() + " phút",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.29,
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Chuẩn bị',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),

                                          SizedBox(
                                            height: 5,
                                          ),

                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              (double.parse(widget.dishTmp.dishTimePrepare)).toString() + " phút",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.29,
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Nấu nướng',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),

                                          SizedBox(
                                            height: 5,
                                          ),

                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              (double.parse(widget.dishTmp.dishTimeCook)).toString() + " phút",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),


                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 25,
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    /*
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StepPage(
                                          listStep: _listSteps,
                                        ),
                                      ),
                                    );
                                    TODO lam gì đó
                                     */
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    child: Center(
                                      child: Text(
                                        'Bắt đầu',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 20,),

                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    /*
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StepPage(
                                          listStep: _listSteps,
                                        ),
                                      ),
                                    );
                                    TODO lam gì đó
                                     */
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Bắt đầu với Simmerai ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),

                                          Icon(
                                            Icons.auto_awesome_outlined,
                                            size: 20,
                                            color: Colors.deepPurple,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),



                        SizedBox(
                          height: 25,
                        ),

                        for(int i = 0; i < _listSteps.length; i++)
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26.withOpacity(0.1),
                                        spreadRadius: 0.5,
                                        blurRadius: 3,
                                        offset: Offset(1, 2),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10, left: 20, bottom: 10, right: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            _listSteps[i].dishStepNumber,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: (MediaQuery.of(context).size.width - 20) * 0.8,
                                          child: Text(
                                            _listSteps[i].dishStepDecription,
                                            style: TextStyle(
                                              fontSize: 17,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),



                      ],
                    ),
                  )
                ],
              )
          ),
        )
    );
  }
}
