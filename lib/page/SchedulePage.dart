import 'dart:ffi';

import 'package:flutter/material.dart';

import '../class/Dish.dart';
import '../dummy/MakeList.dart';
import 'CreatePlant.dart';
import 'DetailPlant.dart';

class Food {
  final String name;
  final String imageUrl;

  Food({
    required this.name,
    required this.imageUrl,
  });
}

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

Widget buildStackedImagesContainer(MakeList f, double wi, double ra) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double imageSize = constraints.maxWidth * 0.6;

      return Container(
        width: double.infinity,
        height: imageSize + 80,
        child: Column(
          children: [
            // Stack of images
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // Bottom image (rotated left)
                  Align(
                    alignment: FractionalOffset(0.3, 0.5),
                    child: Transform.rotate(
                      angle: -0.2,
                      child: Container(
                        width: imageSize,
                        height: imageSize,
                        decoration: BoxDecoration(
                          border: Border.all(width: wi, color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(ra),
                          image: DecorationImage(
                            image: NetworkImage(f.list[2].dishImages[0].dishImage),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Middle image (rotated right)
                  Align(
                    alignment: FractionalOffset(0.7, 0.5),
                    child: Transform.rotate(
                      angle: 0.2,
                      child: Container(
                        width: imageSize,
                        height: imageSize,
                        decoration: BoxDecoration(
                          border: Border.all(width: wi, color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(ra),
                          image: DecorationImage(
                            image: NetworkImage(f.list[1].dishImages[0].dishImage),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Top image (no rotation)
                  Align(
                    alignment: FractionalOffset(0.5, 0.5),
                    child: Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: BoxDecoration(
                        border: Border.all(width: wi, color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(ra),
                        image: DecorationImage(
                          image: NetworkImage(f.list[0].dishImages[0].dishImage),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Text below images
            const SizedBox(height: 8),
            Text(
              f.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    },
  );
}


class _SchedulePageState extends State<SchedulePage> {
  List<MakeList> list_Plant = [
    MakeList("fast food"),
    MakeList("Spaghetti"),
    MakeList("Chicken"),
    MakeList("Curry"),
    MakeList("Cake"),
    MakeList("Vegetable"),
    MakeList("Meat"),
    MakeList("Salad"),
    MakeList("Noodle"),
    MakeList("Rice"),
    MakeList("Tea"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kế hoạch"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatePlant()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kế hoạch nổi bật",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30),

                Container(
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Nút quay lại bên trái
                      Positioned(
                        left: -15,
                        child: IconButton(
                          onPressed: () {

                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.black54,
                            size: 45,
                          ),
                        ),
                      ),

                      // Widget ảnh ở giữa
                      buildStackedImagesContainer(list_Plant[0], 5, 30),

                      // Nút tiếp theo bên phải
                      Positioned(
                        right: -15,
                        child: IconButton(
                          onPressed: () {

                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black54,
                            size: 45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  "Món ăn tối",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    children: [
                      // Container 1
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPlant(plant: list_Plant[1]), // Truyền đối tượng MakeList
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: buildStackedImagesContainer(list_Plant[1], 2, 10),
                        ),
                      ),


                      SizedBox(width: 16),

                      // Container 2
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width *0.3,
                          child: buildStackedImagesContainer(list_Plant[2], 2, 10),
                        ),
                      ),
                      //
                      SizedBox(width: 16),

                      // Container 3
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width *0.3,
                          child: buildStackedImagesContainer(list_Plant[3], 2, 10),
                        ),
                      ),

                      SizedBox(width: 16),

                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width *0.3,
                          child: buildStackedImagesContainer(list_Plant[4], 2, 10),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  "Đề cử",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      // Row 1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: buildStackedImagesContainer(list_Plant[5], 4, 20),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: buildStackedImagesContainer(list_Plant[6], 4, 20),
                          ),
                        ],
                      ),

                      SizedBox(height: 16),

                      // Row 2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: buildStackedImagesContainer(list_Plant[7], 4, 20),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: buildStackedImagesContainer(list_Plant[8], 4, 20),
                          ),
                        ],
                      ),

                      SizedBox(height: 16),

                      // Row 3
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: buildStackedImagesContainer(list_Plant[9], 4, 20),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: buildStackedImagesContainer(list_Plant[10], 4, 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}