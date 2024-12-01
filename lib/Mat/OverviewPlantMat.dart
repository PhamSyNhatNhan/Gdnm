import 'package:flutter/material.dart';
import '../dummy/MakeList.dart';

class OverviewPlantMat extends StatefulWidget {
  final MakeList plant;


  const OverviewPlantMat({Key? key, required this.plant}) : super(key: key);

  @override
  State<OverviewPlantMat> createState() => _OverviewPlantMatState();
}

class _OverviewPlantMatState extends State<OverviewPlantMat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              "Kế hoạch nấu ăn mang đến sự kết hợp hài hòa giữa hương vị và dinh dưỡng, "
                  "phù hợp cho các bữa ăn hàng ngày hoặc dịp đặc biệt. "
                  "Món ăn hứa hẹn sẽ tạo nên trải nghiệm ẩm thực đặc sắc. Phương pháp chế biến đơn giản "
                  "nhưng tinh tế giúp giữ lại độ tươi ngon của nguyên liệu, đồng thời làm "
                  "nổi bật hương vị đặc trưng. Đây sẽ là món ăn đáp ứng được sở thích của "
                  "nhiều đối tượng khác nhau và mang đến cảm giác ngon miệng, thoải mái khi "
                  "thưởng thức.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Các món ăn",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Hiển thị danh sách món ăn
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.plant.list.length,
              itemBuilder: (context, index) {
                final dish = widget.plant.list[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Ảnh món ăn
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            widget.plant.list[index].dishImages[0].dishImage,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        // Tên món ăn
                        Expanded(
                          child: Text(
                            widget.plant.list[index].dishName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        IconButton(
                          onPressed: () {

                          },
                          icon: Icon(
                            Icons.bookmark_border,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
