import 'package:flutter/material.dart';
import 'dish_item.dart';

class PlantUnscheduled extends StatefulWidget {
  @override
  _PlantUnscheduledState createState() => _PlantUnscheduledState();
}

class _PlantUnscheduledState extends State<PlantUnscheduled> {

  List<Recipe> recipes = [
    Recipe(
      imageUrl: 'https://i.pinimg.com/564x/e9/4f/52/e94f523d175a3fee318d28ceb63dd781.jpg',
      dishName: 'Món A',
      duration: '20m',
    ),
    Recipe(
      imageUrl: 'https://i.pinimg.com/564x/e9/4f/52/e94f523d175a3fee318d28ceb63dd781.jpg',
      dishName: 'Món B',
      duration: '30m',
    ),
    Recipe(
      imageUrl: 'https://i.pinimg.com/564x/e9/4f/52/e94f523d175a3fee318d28ceb63dd781.jpg',
      dishName: 'Món C',
      duration: '25m',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Món ăn chưa xếp kế hoạch",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // IconButton for more options
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      // Handle more options
                    },
                  ),
                ],
              ),
            ),

            for (var recipe in recipes) DishItem(recipe: recipe),
          ],
        ),
      ),
    );
  }
}
