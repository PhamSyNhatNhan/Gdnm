import 'package:flutter/material.dart';
import 'package:shimmerai/dummy/MakeList.dart';
import 'package:shimmerai/widget/CommunityCard.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  MakeList listDish = MakeList('Community');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),

                Text(
                  'Cộng đồng',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                for(int i = 0; i < listDish.list.length; i++)
                  Column(
                    children: [
                      CommunityCard(dish: listDish.list[i]),
                      SizedBox(height: 0,),
                    ],
                  )
              ],
            ),
          )
        )
      ),
    );
  }
}