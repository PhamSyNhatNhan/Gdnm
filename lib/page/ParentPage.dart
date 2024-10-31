import 'package:flutter/material.dart';
import 'package:shimmerai/page/ShimmeraiChatPage.dart';
import 'dart:ui';
import 'HomePage.dart';
import 'ProfilePage.dart';
import 'CommunityPage.dart';
import 'SchedulePage.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({super.key, required this.title});
  final String title;

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  int _selectedIndex = 0;
  Offset _buttonPosition = Offset(300, 200);

  final PageStorageBucket _bucket = PageStorageBucket();

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage(key: PageStorageKey('HomePage'));
      case 1:
        return CommunityPage(key: PageStorageKey('CommunityPage'));
      case 2:
        return SchedulePage(key: PageStorageKey('SchedulePage'));
      case 3:
        return ProfilePage(key: PageStorageKey('ProfilePage'));
      default:
        return HomePage(key: PageStorageKey('HomePage'));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          PageStorage(
            bucket: _bucket,
            child: _getPage(_selectedIndex),
          ),
          Positioned(
            left: _buttonPosition.dx,
            top: _buttonPosition.dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _buttonPosition += details.delta;
                });
              },
              child: InkWell(
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.auto_awesome_outlined,
                    color: Colors.deepPurple,
                    size: 30,
                  ),
                ),

                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShimmeraiChatPage()
                    ),
                  );
                },
              )

            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.black12.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                      width: 0.5,
                    ),
                  ),
                  child: BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.restaurant_menu_outlined, size: 28),
                        activeIcon: Icon(Icons.restaurant_menu, size: 28),
                        label: 'Khám phá',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.groups_outlined, size: 28),
                        activeIcon: Icon(Icons.groups, size: 28),
                        label: 'Cộng đồng',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.menu_book_outlined, size: 28),
                        activeIcon: Icon(Icons.menu_book, size: 28),
                        label: 'Kế hoạch',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline_rounded, size: 28),
                        activeIcon: Icon(Icons.person_rounded, size: 28),
                        label: 'Cá nhân',
                      ),
                    ],
                    currentIndex: _selectedIndex,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepPurple.withOpacity(0.8),
                    unselectedItemColor: Colors.deepPurple.withOpacity(0.3),
                    selectedFontSize: 12,
                    unselectedFontSize: 12,
                    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                    onTap: _onItemTapped,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
