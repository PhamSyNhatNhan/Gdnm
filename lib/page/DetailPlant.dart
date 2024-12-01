import 'package:flutter/material.dart';
import '../Mat/GroceMat.dart';
import '../Mat/OverviewPlantMat.dart';
import '../class/Dish.dart';
import '../dummy/MakeList.dart'; // Thêm import nếu MakeList nằm trong class này

class DetailPlant extends StatelessWidget {
  final MakeList plant;

  const DetailPlant({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(plant.title),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: "Tổng quan"),
              Tab(text: "Nguyên liệu"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OverviewPlantMat(plant: plant),
            GrocesMat(plant: plant),
          ],
        ),
      ),
    );
  }
}
