import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dish_item.dart';

class PlanInWeek extends StatefulWidget {
  @override
  _PlanInWeekState createState() => _PlanInWeekState();
}

class _PlanInWeekState extends State<PlanInWeek> {
  DateTime _selectedDate = DateTime.now();
  Map<String, bool> expandedDays = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  Map<String, List<Recipe>> recipesByDay = {
    'Monday': [
      Recipe(
        imageUrl: 'https://i.pinimg.com/564x/e9/4f/52/e94f523d175a3fee318d28ceb63dd781.jpg',
        dishName: 'Pumpkin & Sage Pasta',
        duration: '1h 10m',
      ),
      Recipe(
        imageUrl: 'https://i.pinimg.com/564x/e9/4f/52/e94f523d175a3fee318d28ceb63dd781.jpg',
        dishName: 'Spaghetti Carbonara',
        duration: '40m',
      ),
    ],
    'Tuesday': [
      Recipe(
        imageUrl: 'https://i.pinimg.com/564x/e9/4f/52/e94f523d175a3fee318d28ceb63dd781.jpg',
        dishName: 'Chicken Caesar Salad',
        duration: '30m',
      ),
    ],
    'Wednesday': [],
    'Thursday': [
      Recipe(
        imageUrl: 'https://i.pinimg.com/564x/e9/4f/52/e94f523d175a3fee318d28ceb63dd781.jpg',
        dishName: 'Mushroom Risotto',
        duration: '1h',
      ),
    ],
    'Friday': [],
    'Saturday': [],
    'Sunday': [],
  };

  String getWeekRange(DateTime date) {
    DateTime startOfWeek = date.subtract(Duration(days: date.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
    String start = DateFormat('d MMM').format(startOfWeek);
    String end = DateFormat('d MMM').format(endOfWeek);
    return "$start - $end";
  }

  void _previousWeek() {
    setState(() {
      _selectedDate = _selectedDate.subtract(Duration(days: 7));
    });
  }

  void _nextWeek() {
    setState(() {
      _selectedDate = _selectedDate.add(Duration(days: 7));
    });
  }

  void _toggleExpand(String day) {
    setState(() {
      expandedDays[day] = !(expandedDays[day] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

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
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: _previousWeek,
                        ),
                        Text(
                          getWeekRange(_selectedDate),
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: _nextWeek,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      // Handle more options
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            ...daysOfWeek.map((day) {
              bool isExpanded = expandedDays[day] ?? false;
              List<Recipe> recipes = recipesByDay[day] ?? [];

              return Container(
                margin: EdgeInsets.symmetric(vertical: 4.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.add_circle),
                              color: Colors.deepPurple,
                              onPressed: () {
                                // Handle add recipe for the day
                              },
                            ),
                            Text(
                              day,
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        if (recipes.isNotEmpty)
                          InkWell(
                            onTap: () => _toggleExpand(day),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple[100],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "${recipes.length}",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    isExpanded ? Icons.expand_less : Icons.chevron_right,
                                    color: Colors.deepPurple,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    if (isExpanded)
                      Column(
                        children: recipes.map((recipe) => DishItem(recipe: recipe)).toList(),
                      ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
