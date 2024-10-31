import 'package:flutter/material.dart';
import 'package:shimmerai/widget/DiscoveryWidget.dart';

import '../dummy/MakeList.dart';
import '../widget/DiscoveryCard.dart';
import '../widget/DiscoveryComTrendCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MakeList> danhSach = [
    MakeList("Đã xem"),
    MakeList("Xu hướng"),
    MakeList("Happy Halloween"),
    MakeList("Nổi bật trong tuần"),
    MakeList("Bữa sáng của nhà vô địch")
  ];

  MakeList comTrend = MakeList("Mọi người đang cook!");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            border: InputBorder.none,
                            hintText: 'Tìm kiếm công thức...',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: InkWell(
                          child: Icon(
                            Icons.search,
                            color: Colors.grey[400],
                          ),

                          onTap: (){

                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Đang được yêu thích',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      Container(
                          width: double.maxFinite,
                          height: 500,
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              ClipRRect( 
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                child: Image.network(
                                  'https://media.baoquangninh.vn/dataimages/201306/original/images679639_54b3e28loikhuyenchonhungnguoit.jpg',
                                  width: 400,
                                  height: 350,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              
                              SizedBox(
                                height: 5,
                              ),
                              
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 15, left: 20, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.auto_awesome_outlined,
                                          size: 15,
                                        ),

                                        SizedBox(width: 5,),

                                        Text(
                                          'Dễ • 35 phút • ',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                        SizedBox(width: 5,),

                                        Icon(
                                          Icons.thumb_up_alt_outlined,
                                          size: 15,
                                        ),

                                        Text(
                                          '90 %',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Text(
                                      'Hambergur thịt bò ăn kèm khoai tây chiên',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              comTrend.title,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 15),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (int i = 0; i < comTrend.list.length; i++)
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            DiscoveryComTrendCard(dish: comTrend.list[i],),
                                            SizedBox(width: 20)
                                          ],
                                        ),

                                        SizedBox(height:10)
                                      ],
                                    )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      for(int i = 0; i < danhSach.length; i++)
                        DiscoveryWidget(list: danhSach[i],)
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}