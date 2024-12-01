import 'package:flutter/material.dart';
import 'package:intrinsic_dimension/intrinsic_dimension.dart';
import 'package:shimmerai/mat/ActivityMat.dart';
import 'package:shimmerai/mat/CookbookMat.dart';
import 'package:shimmerai/mat/SavedRecipesMat.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentPage = 0;
  double _sliverToBoxAdapterHeight = 0.0;
  String userName = "Simmerai";
  String userAvatar = "https://static.wikia.nocookie.net/gochiusa/images/1/18/Tippy.png/revision/latest?cb=20160203062255";
  Map<String, String> stats = {
    "đánh giá": "15",
    "tips": "8",
    "ảnh": "24"
  };

  void selectTab(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  final List<Widget> pages = [
    SavedRecipesMat(),
    CookbookMat(),
    ActivityMat()
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Container(
                child: Stack(
                  children: [
                    // Background gradient & pattern
                    Positioned(
                      top: -10,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: screenHeight * 0.25,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.deepPurple.withOpacity(0.1),
                              Colors.white.withOpacity(0.95),
                              Colors.white,
                            ],
                          ),
                        ),
                        child: CustomPaint(
                          painter: CirclePatternPainter(
                            color: Colors.deepPurple.withOpacity(0.05),
                          ),
                        ),
                      ),
                    ),

                    // Settings Button
                    Positioned(
                      top: screenHeight * 0.02,
                      right: screenWidth * 0.05,
                      child: IconButton(
                        icon: Icon(
                          Icons.settings_outlined,
                          size: screenWidth * 0.07,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          // TODO: Implement settings
                        },
                      ),
                    ),

                    // Profile Content
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: screenHeight * 0.025),

                        // Avatar with decoration
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: screenWidth * 0.12,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.network(
                                  userAvatar,
                                  width: screenWidth * 0.24,
                                  height: screenWidth * 0.24,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.deepPurple,
                                        ),
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: screenWidth * 0.15,
                                      color: Colors.deepPurple.withOpacity(0.5),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.02),

                        // Username
                        Text(
                          userName,
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.02),

                        // Stats Row
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: stats.entries.map((entry) {
                              return Container(
                                padding: EdgeInsets.all(screenWidth * 0.02),
                                child: Column(
                                  children: [
                                    Text(
                                      entry.value,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.045,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.005),
                                    Text(
                                      entry.key,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.02),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Tab Bar
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 0,
              toolbarHeight: screenHeight * 0.07,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTab("Công thức", 0),
                      buildTab("Sách nấu ăn", 1),
                      buildTab("Hoạt động", 2),
                    ],
                  ),
                ),
              ),
            ),

            // Content
            SliverToBoxAdapter(
              child: IntrinsicDimension(
                listener: (_, __, height, ____) {
                  setState(() {
                    _sliverToBoxAdapterHeight = height;
                  });
                },
                builder: (_, __, ___, ____) => pages[_currentPage],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTab(String text, int index) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => selectTab(index),
      child: Container(
        width: screenWidth / 3,
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.03,
          horizontal: screenWidth * 0.02,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _currentPage == index
                  ? Colors.deepPurple
                  : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: _currentPage == index
                  ? Colors.deepPurple
                  : Colors.deepPurple.withOpacity(0.5),
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class CirclePatternPainter extends CustomPainter {
  final Color color;

  CirclePatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double spacing = size.width / 12;
    for (double x = 0; x < size.width + spacing; x += spacing) {
      for (double y = 0; y < size.height + spacing; y += spacing) {
        double offset = (y / spacing).floor() % 2 * spacing / 2;
        canvas.drawCircle(
          Offset(x + offset, y),
          spacing / 8,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}