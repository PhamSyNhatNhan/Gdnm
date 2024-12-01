import 'package:flutter/material.dart';
import 'package:shimmerai/page/Shimmerai.dart';

import '../class/Dish.dart';
import '../dummy/DishDummy.dart';

class ShimmeraiChatPage extends StatefulWidget {
  const ShimmeraiChatPage({super.key});

  @override
  State<ShimmeraiChatPage> createState() => _ShimmeraiChatPageState();
}

class _ShimmeraiChatPageState extends State<ShimmeraiChatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();
  String sortBy = 'newest'; // 'newest' or 'oldest'

  final Map<String, List<ChatHistory>> groupedChatHistory = {
    'Hôm nay': [
      ChatHistory(
        title: "Trò chuyện về AI",
        lastMessage: "AI có thể giúp gì cho cuộc sống của chúng ta?",
        time: "10:30",
        unreadCount: 2,
        isPinned: true,
      ),
      ChatHistory(
        title: "Lập trình Flutter",
        lastMessage: "Cách tạo animation trong Flutter",
        time: "08:45",
        unreadCount: 0,
        isPinned: false,
      ),
    ],
    'Tuần này': [
      ChatHistory(
        title: "Hỏi về Flutter",
        lastMessage: "Làm thế nào để tạo một ứng dụng Flutter?",
        time: "Thứ 2",
        unreadCount: 1,
        isPinned: false,
      ),
      ChatHistory(
        title: "Machine Learning",
        lastMessage: "Các mô hình ML phổ biến",
        time: "Thứ 3",
        unreadCount: 0,
        isPinned: true,
      ),
    ],
    'Tháng này': [
      ChatHistory(
        title: "Data Science",
        lastMessage: "Phân tích dữ liệu với Python",
        time: "15/10",
        unreadCount: 0,
        isPinned: false,
      ),
      ChatHistory(
        title: "Web Development",
        lastMessage: "React vs Angular vs Vue",
        time: "10/10",
        unreadCount: 3,
        isPinned: false,
      ),
    ],
  };

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.arrow_downward,
                  color: sortBy == 'newest' ? Colors.deepPurple : Colors.grey),
              title: Text('Mới nhất'),
              selected: sortBy == 'newest',
              onTap: () {
                setState(() => sortBy = 'newest');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_upward,
                  color: sortBy == 'oldest' ? Colors.deepPurple : Colors.grey),
              title: Text('Cũ nhất'),
              selected: sortBy == 'oldest',
              onTap: () {
                setState(() => sortBy = 'oldest');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showChatOptions(ChatHistory chat) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.only(top: 10, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                chat.isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                color: Colors.deepPurple,
              ),
              title: Text(chat.isPinned ? 'Bỏ ghim' : 'Ghim đoạn chat'),
              onTap: () {
                // Xử lý ghim/bỏ ghim
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.mark_chat_read, color: Colors.deepPurple),
              title: Text('Đánh dấu đã đọc'),
              onTap: () {
                // Xử lý đánh dấu đã đọc
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.archive_outlined, color: Colors.deepPurple),
              title: Text('Lưu trữ'),
              onTap: () {
                // Xử lý lưu trữ
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete_outline, color: Colors.red),
              title: Text('Xóa', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                _showDeleteConfirmation();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Xóa đoạn chat?'),
        content: Text('Đoạn chat này sẽ bị xóa vĩnh viễn. Bạn có chắc chắn muốn xóa?'),
        actions: [
          TextButton(
            child: Text('Hủy'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('Xóa', style: TextStyle(color: Colors.red)),
            onPressed: () {
              // Xử lý xóa chat
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChatTile(ChatHistory chat) {
    return ListTile(
      leading: Stack(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple.withOpacity(0.1),
            ),
            child: Icon(
              Icons.chat_outlined,
              color: Colors.deepPurple,
            ),
          ),
          if (chat.isPinned)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.push_pin,
                  size: 12,
                  color: Colors.deepPurple,
                ),
              ),
            ),
        ],
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              chat.title,
              style: TextStyle(
                fontWeight: chat.unreadCount > 0 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          if (chat.unreadCount > 0)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                chat.unreadCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
      subtitle: Text(
        chat.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: chat.unreadCount > 0 ? Colors.black87 : Colors.grey,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            chat.time,
            style: TextStyle(
              color: chat.unreadCount > 0 ? Colors.deepPurple : Colors.grey,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 4),
          Icon(
            Icons.more_horiz,
            color: Colors.grey,
            size: 16,
          ),
        ],
      ),
      onTap: () {
        Navigator.pop(context);
      },
      onLongPress: () => _showChatOptions(chat),
    );
  }

  Widget _buildAttachmentOption({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 80,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.deepPurple,
                size: 24,
              ),
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            controller: searchController,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(horizontal: 20),
                              border: InputBorder.none,
                              hintText: 'Tìm kiếm...',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        if (searchController.text.isNotEmpty)
                          IconButton(
                            icon: Icon(Icons.clear, color: Colors.grey),
                            onPressed: () {
                              setState(() {
                                searchController.clear();
                              });
                            },
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            child: Icon(
                              Icons.search,
                              color: Colors.deepPurple,
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: Colors.deepPurple,
                              size: 24,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Đoạn chat mới',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.sort, color: Colors.deepPurple),
                        onPressed: _showSortOptions,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: groupedChatHistory.length,
                itemBuilder: (context, groupIndex) {
                  String timeGroup = groupedChatHistory.keys.elementAt(groupIndex);
                  List<ChatHistory> chats = groupedChatHistory[timeGroup]!;

                  chats.sort((a, b) {
                    if (a.isPinned != b.isPinned) {
                      return a.isPinned ? -1 : 1;
                    }
                    return sortBy == 'newest' ? -1 : 1;
                  });

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                          bottom: 8,
                        ),
                        child: Text(
                          timeGroup,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      ...chats.map((chat) => _buildChatTile(chat)).toList(),
                      if (groupIndex < groupedChatHistory.length - 1)
                        Divider(height: 1),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),


      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0, left: 0, bottom: 0, right: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 25),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.menu,
                              size: 30,
                              color: Colors.deepPurple,
                            ),
                            onTap: () {
                              _scaffoldKey.currentState?.openDrawer();
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
                              Navigator.pop(context);
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




                  Container(
                    height: MediaQuery.of(context).size.height - 25 - 50 - 90,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Bot welcome message
                          _buildBotMessage(
                            'Xin chào! Tôi có thể giúp gì cho bạn?',
                            showSuggestions: true,
                          ),

                          // User message
                          _buildUserMessage('Gợi ý cho tôi vài món ngon'),

                          // Bot response with dishes
                          _buildBotMessage(
                            'Đây là một số món ăn phổ biến bạn có thể thử:',
                            dishes: dummyDishes.sublist(0, 3),
                          ),

                          // Additional conversation
                          _buildUserMessage('Cho tôi xem công thức món đầu tiên'),

                          _buildBotMessage(
                            'Dưới đây là công thức chi tiết cho món ${dummyDishes[0].dishName}:\n',
                          ),

                          _buildUserMessage('Món này có khó làm không?'),

                          _buildBotMessage(
                            'Món này tương đối đơn giản và phù hợp cho người mới bắt đầu nấu ăn. '
                                'Điểm quan trọng nhất là kiểm soát lửa và thời gian nấu. '
                                'Bạn có muốn tôi chia sẻ thêm một số mẹo để làm món này ngon hơn không?',
                          ),

                          _buildUserMessage('Có, bạn chia sẻ thêm đi'),

                          _buildBotMessage(
                            'Đây là một số mẹo hữu ích:\n\n'
                                '1. Marinading: Ướp thịt ít nhất 30 phút để thấm gia vị\n'
                                '2. Nhiệt độ: Đun lửa vừa để thịt chín đều\n'
                                '3. Timing: Không nấu quá lâu để thịt không bị dai\n'
                                '4. Garnishing: Trang trí với rau mùi và ớt tươi',
                          ),
                        ],
                      ),
                    ),
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
                                          offset.dy - 150,
                                          offset.dx + 20,
                                          offset.dy,
                                        ),
                                        items: [
                                          PopupMenuItem(
                                            height: 40,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.auto_awesome_outlined, color: Colors.deepPurple, size: 20),
                                                SizedBox(width: 10),
                                                Text('Simmerai', style: TextStyle(fontSize: 14)),
                                              ],
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Shimmerai()
                                                ),
                                              );
                                            },
                                          ),
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
                                        padding: const EdgeInsets.only(right: 10),
                                        child: InkWell(
                                          child: Icon(
                                            Icons.mic,
                                            color: Colors.deepPurple,
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
      ),
    );
  }
}



class ChatHistory {
  final String title;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool isPinned;

  ChatHistory({
    required this.title,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    this.isPinned = false,
  });
}

Widget _buildDishSuggestion(Dish dish) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.grey[50],
    ),
    child: InkWell(
      onTap: () {
        // Handle tap
      },
      child: Row(
        children: [
          // Dish image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              dish.dishImages[0].dishImage,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          // Dish info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish.dishName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  dish.dishDecription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '${dish.dishTimeCook} phút',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildSuggestionChip(String label) {
  return InkWell(
    onTap: () {
      // Handle suggestion tap
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.deepPurple.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.deepPurple,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget _buildBotMessage(String text, {bool showSuggestions = false, List<Dish>? dishes}) {
  return Padding(
    padding: EdgeInsets.only(left: 15, right: 60, bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bot avatar
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.auto_awesome,
            color: Colors.deepPurple,
            size: 20,
          ),
        ),
        SizedBox(height: 8),
        // Message content
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
                color: Colors.grey.withOpacity(0.1),
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
                    _buildSuggestionChip('Tìm công thức nấu ăn'),
                    _buildSuggestionChip('Món ăn phổ biến'),
                    _buildSuggestionChip('Gợi ý món mới'),
                  ],
                ),
              ],
              if (dishes != null) ...[
                SizedBox(height: 15),
                ...dishes.map((dish) => Column(
                  children: [
                    _buildDishSuggestion(dish),
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
      width: double.infinity, // Để container chiếm full width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: double.infinity), // Cho phép text flexible
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
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


Widget _buildFloatingFollowCounterWithInfo(Dish dish, int currentStep) {
  return Positioned(
    top: 100,
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
