import 'package:flutter/material.dart';

import '../class/Dish.dart';
import '../dummy/DishDummy.dart';

class Shimmerai extends StatefulWidget {
  const Shimmerai({super.key});

  @override
  State<Shimmerai> createState() => _ShimmeraiState();
}

class _ShimmeraiState extends State<Shimmerai> {
  bool isMicroOn = true;

  void changeMicroState(){
    isMicroOn = !isMicroOn;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(height: 25,),

                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.deepPurple,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          InkWell(
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.7),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.auto_awesome_outlined,
                                size: 30,
                                color: Colors.deepPurple,
                              ),
                            ),
                            onTap: () {

                            },
                          ),
                          InkWell(
                            child: Icon(
                              Icons.more_vert_rounded,
                              size: 30,
                              color: Colors.deepPurple,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),


                  Stack(
                    children: [
                      // Background camera view
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height - 25 - 50 - 90,
                        color: Colors.black87,
                        child: Image.network(
                          'https://i.pinimg.com/736x/e9/88/14/e988145161aa1052bef733a32e6bd642.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),


                      Positioned(
                        right: 0,
                        bottom: 100,
                        child: Container(
                          width: MediaQuery.of(context).size.width ,
                          height: (MediaQuery.of(context).size.height - 25 - 50 - 90) * 0.3,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                _buildBotMessage(
                                  'Tôi thấy cá đã được ướp đều. Giờ bạn đặt chảo lên bếp và cho dầu vào.',
                                ),
                                _buildUserMessage('Dầu đã sôi lăn tăn rồi'),

                                _buildBotMessage(
                                  'Được rồi, cho cá vào và để lửa vừa nhé.',
                                ),

                                _buildUserMessage('Cá đã vàng một mặt'),

                                _buildBotMessage(
                                  'Tốt! Lật mặt còn lại và giảm lửa xuống.',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 20,
                        right: MediaQuery.of(context).size.width * 0.41,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(
                              isMicroOn ? Icons.mic : Icons.mic_off,
                              size: 30,
                              color: Colors.deepPurple,
                            ),
                            onPressed: () {
                              changeMicroState();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),




                  Container(
                    height: 70,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Builder(
                                  builder: (context) => InkWell(
                                    child: Icon(
                                      Icons.add,
                                      size: 25,
                                      color: Colors.deepPurple,
                                    ),
                                    onTap: () {
                                      final RenderBox button = context.findRenderObject() as RenderBox;
                                      final Offset offset = button.localToGlobal(Offset.zero);

                                      showMenu(
                                        context: context,
                                        position: RelativeRect.fromLTRB(
                                          offset.dx,
                                          offset.dy - 110,
                                          offset.dx + 20,
                                          offset.dy,
                                        ),
                                        items: [
                                          PopupMenuItem(
                                            height: 40,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.image, color: Colors.deepPurple, size: 20),
                                                SizedBox(width: 10),
                                                Text('Hình ảnh', style: TextStyle(fontSize: 14)),
                                              ],
                                            ),
                                            onTap: () {

                                            },
                                          ),
                                          PopupMenuItem(
                                            height: 40,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.attach_file, color: Colors.deepPurple, size: 20),
                                                SizedBox(width: 10),
                                                Text('Tệp đính kèm', style: TextStyle(fontSize: 14)),
                                              ],
                                            ),
                                            onTap: () {

                                            },
                                          ),
                                        ],
                                        elevation: 8,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        constraints: BoxConstraints(
                                          minWidth: 150,
                                          maxWidth: 150,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width - 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
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
                                            contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                            border: InputBorder.none,
                                            hintText: 'Chat với Simmerai...',
                                            hintStyle: TextStyle(color: Colors.grey[400]),
                                          ),
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10, bottom: 5),
                                        child: InkWell(
                                          child: Transform.rotate(
                                            angle: -0.785,
                                            child: Icon(
                                              Icons.send,
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                          onTap: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),




                ],
              ),
            ),

            _buildFloatingFollowCounterWithInfo(dummyDishes[22], 1)
          ],
        )
    );
  }
}


Widget _buildFloatingFollowCounterWithInfo(Dish dish, int currentStep) {
  return Positioned(
    top: 110,
    right: 15,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dish image
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  dish.dishImages[0].dishImage,
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              // Dish name
              Text(
                dish.dishName,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        SizedBox(height: 8),

        // Current step indicator
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Step',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: 4),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    currentStep.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildBotMessage(String text, {bool showSuggestions = false, List<Dish>? dishes}) {
  return Padding(
    padding: EdgeInsets.only(left: 15, right: 60, bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              if (showSuggestions) ...[
                SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                  ],
                ),
              ],
              if (dishes != null) ...[
                SizedBox(height: 15),
                ...dishes.map((dish) => Column(
                  children: [

                    SizedBox(height: 10),
                  ],
                )).toList(),
              ],
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildUserMessage(String text) {
  return Padding(
    padding: EdgeInsets.only(left: 80, right: 15, bottom: 20),
    child: Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: double.infinity),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              border: Border.all(
                color: Colors.deepPurple,
                width: 2,
              ),
            ),
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}



