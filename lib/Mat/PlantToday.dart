import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dish_item.dart';

class PlantToday extends StatefulWidget {
  @override
  _PlantTodayState createState() => _PlantTodayState();
}

class _PlantTodayState extends State<PlantToday> {
  DateTime _selectedDate = DateTime.now();

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

  String getFormattedDate(DateTime date) {
    return DateFormat('EEE, MMM d').format(date);
  }

  void _previousDay() {
    setState(() {
      _selectedDate = _selectedDate.subtract(Duration(days: 1));
    });
  }

  void _nextDay() {
    setState(() {
      _selectedDate = _selectedDate.add(Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row with date navigation
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: _previousDay,
                        ),
                        Text(
                          getFormattedDate(_selectedDate),
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: _nextDay,
                        ),
                      ],
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


            // Add new recipe button
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add_circle),
                    color: Colors.deepPurple,
                    onPressed: () {
                      // Handle more options
                    },
                  ),
                  Text(
                    "Thêm công thức",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Hiển thị danh sách công thức
            for (var recipe in recipes) DishItem(recipe: recipe),
          ],
        ),
      ),
    );
  }
}
