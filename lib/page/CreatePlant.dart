import 'package:flutter/material.dart';

import '../Mat/PlantInWeek.dart';
import '../Mat/PlantToday.dart';
import '../Mat/PlantUnscheduled.dart';

class CreatePlant extends StatefulWidget {
  @override
  _CreatePlantState createState() => _CreatePlantState();
}

class _CreatePlantState extends State<CreatePlant> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kế hoạch"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: "Trong ngày"),
              Tab(text: "Trong tuần"),
              Tab(text: "Chưa xếp"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PlantToday(),
            PlanInWeek(),
            PlantUnscheduled(),
          ],
        ),
      ),
    );
  }
}
