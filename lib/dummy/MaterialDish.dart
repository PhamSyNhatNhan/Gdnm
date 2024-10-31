// lib/dummy/material_dummy.dart

import '../class/DishMaterial.dart';

Map<String, List<DishMaterial>> materialsByDish = {
  "D001": [ // Phở bò
    DishMaterial("Phở", "200", "300"),
    DishMaterial("Thịt bò", "150", "250"),
    DishMaterial("Hành", "30", "10"),
    DishMaterial("Gia vị phở", "20", "5"),
    DishMaterial("Giá đỗ", "50", "15"),
  ],
  "D002": [ // Bún chả
    DishMaterial("Bún", "200", "280"),
    DishMaterial("Thịt lợn", "200", "400"),
    DishMaterial("Rau sống", "100", "20"),
    DishMaterial("Gia vị ướp", "30", "10"),
  ],
  "D003": [ // Cơm tấm sườn
    DishMaterial("Cơm", "200", "260"),
    DishMaterial("Sườn", "150", "300"),
    DishMaterial("Bì", "50", "100"),
    DishMaterial("Chả trứng", "100", "180"),
  ],
  "D004": [ // Bánh xèo
    DishMaterial("Bột gạo", "150", "180"),
    DishMaterial("Tôm", "100", "90"),
    DishMaterial("Thịt", "100", "200"),
    DishMaterial("Giá đỗ", "100", "30"),
    DishMaterial("Rau sống", "100", "20"),
  ],
  "D005": [ // Bún bò Huế
    DishMaterial("Bún", "200", "260"),
    DishMaterial("Thịt bò", "150", "300"),
    DishMaterial("Giò heo", "100", "200"),
    DishMaterial("Mắm ruốc", "30", "40"),
    DishMaterial("Sả ớt", "50", "10"),
  ],
  "D006": [ // Cá kho tộ
    DishMaterial("Cá lóc", "300", "350"),
    DishMaterial("Thịt ba chỉ", "100", "300"),
    DishMaterial("Nước mắm", "50", "20"),
    DishMaterial("Gia vị kho", "30", "10"),
  ],
  "D007": [ // Gỏi cuốn
    DishMaterial("Bánh tráng", "100", "120"),
    DishMaterial("Tôm", "150", "135"),
    DishMaterial("Thịt heo", "100", "200"),
    DishMaterial("Bún", "100", "130"),
    DishMaterial("Rau herbs", "50", "10"),
  ],
  "D008": [ // Mì Quảng
    DishMaterial("Mì Quảng", "200", "260"),
    DishMaterial("Tôm", "100", "90"),
    DishMaterial("Thịt", "100", "200"),
    DishMaterial("Đậu phộng", "30", "180"),
    DishMaterial("Rau sống", "50", "10"),
  ],
  "D009": [ // Cơm niêu
    DishMaterial("Gạo", "200", "260"),
    DishMaterial("Cá kho", "200", "240"),
    DishMaterial("Rau cải", "100", "30"),
    DishMaterial("Gia vị", "30", "10"),
  ],
  "D010": [ // Bánh mì thịt
    DishMaterial("Bánh mì", "100", "240"),
    DishMaterial("Patê", "30", "100"),
    DishMaterial("Thịt nguội", "50", "120"),
    DishMaterial("Rau dưa", "30", "10"),
  ],
  "D011": [ // Bún riêu
    DishMaterial("Bún", "200", "260"),
    DishMaterial("Cua", "150", "130"),
    DishMaterial("Đậu phụ", "100", "80"),
    DishMaterial("Mắm tôm", "20", "30"),
    DishMaterial("Rau sống", "50", "10"),
  ],
  "D012": [ // Chả cá Lã Vọng
    DishMaterial("Cá lăng", "300", "300"),
    DishMaterial("Thì là", "50", "10"),
    DishMaterial("Hành tây", "100", "40"),
    DishMaterial("Bún", "200", "260"),
  ],
  "D013": [ // Canh chua cá lóc
    DishMaterial("Cá lóc", "300", "300"),
    DishMaterial("Dứa", "100", "50"),
    DishMaterial("Đậu bắp", "100", "30"),
    DishMaterial("Me chua", "30", "20"),
    DishMaterial("Rau om", "20", "5"),
  ],
  "D014": [ // Gà nướng
    DishMaterial("Gà", "500", "750"),
    DishMaterial("Sả", "50", "10"),
    DishMaterial("Ớt", "20", "5"),
    DishMaterial("Gia vị ướp", "50", "20"),
  ],
  "D015": [ // Bò lúc lắc
    DishMaterial("Thịt bò", "300", "450"),
    DishMaterial("Tiêu đen", "10", "5"),
    DishMaterial("Tỏi", "20", "10"),
    DishMaterial("Gia vị ướp", "30", "15"),
  ],
  "D016": [ // Bánh cuốn
    DishMaterial("Bột gạo", "200", "240"),
    DishMaterial("Thịt băm", "100", "200"),
    DishMaterial("Nấm mèo", "30", "20"),
    DishMaterial("Hành khô", "20", "15"),
  ],
  "D017": [ // Cơm gà Hải Nam
    DishMaterial("Gạo", "200", "260"),
    DishMaterial("Gà", "400", "600"),
    DishMaterial("Gừng", "30", "10"),
    DishMaterial("Hành tỏi", "30", "15"),
  ],
  "D018": [ // Hủ tiếu Nam Vang
    DishMaterial("Hủ tiếu", "200", "260"),
    DishMaterial("Tôm", "100", "90"),
    DishMaterial("Thịt", "100", "200"),
    DishMaterial("Giá đỗ", "50", "15"),
    DishMaterial("Rau sống", "50", "10"),
  ],
  "D019": [ // Lẩu thái
    DishMaterial("Hải sản", "400", "360"),
    DishMaterial("Nấm các loại", "200", "60"),
    DishMaterial("Rau sống", "200", "40"),
    DishMaterial("Gia vị lẩu", "50", "20"),
  ],
  "D020": [ // Mực xào sa tế
    DishMaterial("Mực tươi", "300", "270"),
    DishMaterial("Sa tế", "30", "45"),
    DishMaterial("Hành tỏi", "30", "15"),
    DishMaterial("Ớt", "20", "5"),
  ],
  "D021": [ // Cháo lòng
    DishMaterial("Gạo", "150", "195"),
    DishMaterial("Lòng heo", "200", "300"),
    DishMaterial("Đậu phụ", "100", "80"),
    DishMaterial("Hành ngò", "30", "5"),
  ],
  "D022": [ // Sườn xào chua ngọt
    DishMaterial("Sườn non", "300", "450"),
    DishMaterial("Ớt chuông", "100", "30"),
    DishMaterial("Dứa", "100", "50"),
    DishMaterial("Gia vị", "30", "15"),
  ],
  "D023": [ // Cá chiên mắm gừng
    DishMaterial("Cá diêu hồng", "400", "440"),
    DishMaterial("Gừng", "50", "15"),
    DishMaterial("Nước mắm", "50", "20"),
    DishMaterial("Gia vị", "30", "10"),
  ],
  "D024": [ // Rau muống xào tỏi
    DishMaterial("Rau muống", "300", "60"),
    DishMaterial("Tỏi", "30", "15"),
    DishMaterial("Dầu ăn", "30", "270"),
    DishMaterial("Gia vị", "20", "10"),
  ],
  "D025": [ // Cơm chiên dương châu
    DishMaterial("Cơm nguội", "300", "390"),
    DishMaterial("Xá xíu", "100", "200"),
    DishMaterial("Tôm", "100", "90"),
    DishMaterial("Trứng", "100", "155"),
    DishMaterial("Rau củ", "100", "30"),
  ],
  "D026": [ // Gỏi đu đủ
    DishMaterial("Đu đủ xanh", "300", "120"),
    DishMaterial("Tôm khô", "50", "175"),
    DishMaterial("Lạc rang", "50", "295"),
    DishMaterial("Ớt", "20", "5"),
  ],
  "D027": [ // Thịt kho tàu
    DishMaterial("Thịt ba chỉ", "300", "900"),
    DishMaterial("Trứng", "200", "310"),
    DishMaterial("Nước dừa", "200", "90"),
    DishMaterial("Gia vị", "30", "15"),
  ],
  "D028": [ // Cà ri gà
    DishMaterial("Gà", "400", "600"),
    DishMaterial("Khoai tây", "200", "170"),
    DishMaterial("Cà rốt", "100", "41"),
    DishMaterial("Bột cà ri", "30", "60"),
  ],
  "D029": [ // Khổ qua xào trứng
    DishMaterial("Khổ qua", "300", "75"),
    DishMaterial("Trứng", "200", "310"),
    DishMaterial("Hành tỏi", "30", "15"),
    DishMaterial("Gia vị", "20", "10"),
  ],
  "D030": [ // Canh khổ qua nhồi thịt
    DishMaterial("Khổ qua", "400", "100"),
    DishMaterial("Thịt băm", "200", "400"),
    DishMaterial("Mộc nhĩ", "30", "10"),
    DishMaterial("Gia vị", "30", "15"),
  ],
};

