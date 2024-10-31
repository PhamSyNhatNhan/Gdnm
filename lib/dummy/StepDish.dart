import '../class/DishStep.dart';

Map<String, List<DishStep>> stepsByDish = {
  "D001": [
    // Phở bò
    DishStep("1", "", "Làm nước dùng: Hầm xương với các gia vị trong 6-8 giờ"),
    DishStep("2", "", "Thái thịt bò mỏng, trần sơ qua nước sôi"),
    DishStep("3", "", "Trụng bánh phở trong nước sôi"),
    DishStep("4", "", "Xếp bánh phở, thịt vào tô"),
    DishStep("5", "", "Chan nước dùng và thêm các loại rau gia vị"),
  ],
  "D002": [
    // Bún chả
    DishStep("1", "", "Ướp thịt với hành tỏi, nước mắm, đường trong 2 giờ"),
    DishStep("2", "", "Chuẩn bị than hồng để nướng thịt"),
    DishStep("3", "", "Nướng thịt đến khi vàng đều hai mặt"),
    DishStep("4", "", "Pha nước chấm với tỏi ớt, đu đủ cà rốt"),
    DishStep("5", "", "Bày trí bún, rau sống và thịt nướng"),
  ],
  "D003": [
    // Cơm tấm sườn
    DishStep("1", "", "Ướp sườn với gia vị, để thấm 1 giờ"),
    DishStep("2", "", "Nướng sườn trên than hoặc lò nướng"),
    DishStep("3", "", "Làm chả trứng và bì"),
    DishStep("4", "", "Nấu cơm dẻo"),
    DishStep("5", "", "Bày trí cơm với sườn, bì, chả và đồ chua"),
  ],
  "D004": [
    // Bánh xèo
    DishStep("1", "", "Trộn bột bánh xèo với nước cốt dừa"),
    DishStep("2", "", "Chuẩn bị nhân tôm thịt và giá đỗ"),
    DishStep("3", "", "Đổ bánh trong chảo nóng"),
    DishStep("4", "", "Cho nhân vào và đậy nắp"),
    DishStep("5", "", "Gấp đôi bánh khi giòn vàng"),
  ],
  "D005": [
    // Bún bò Huế
    DishStep("1", "", "Nấu nước dùng với xương và gân bò"),
    DishStep("2", "", "Xào sả ớt và gia vị"),
    DishStep("3", "", "Nấu nước dùng với sả ớt đã xào"),
    DishStep("4", "", "Luộc bún và chuẩn bị rau sống"),
    DishStep("5", "", "Trình bày bún, thịt và chan nước dùng"),
  ],
  "D006": [
    // Cá kho tộ
    DishStep("1", "", "Làm sạch cá, ướp với gia vị"),
    DishStep("2", "", "Phi thơm hành tỏi"),
    DishStep("3", "", "Xếp thịt ba chỉ lót đáy nồi"),
    DishStep("4", "", "Xếp cá vào và kho nhỏ lửa"),
    DishStep("5", "", "Kho đến khi nước cạn sệt"),
  ],
  "D007": [
    // Gỏi cuốn
    DishStep("1", "", "Luộc tôm và thịt chín"),
    DishStep("2", "", "Chuẩn bị bún và rau herbs"),
    DishStep("3", "", "Ngâm bánh tráng"),
    DishStep("4", "", "Cuốn với đầy đủ nguyên liệu"),
    DishStep("5", "", "Làm nước chấm đi kèm"),
  ],
  "D008": [
    // Mì Quảng
    DishStep("1", "", "Nấu nước dùng với xương"),
    DishStep("2", "", "Sơ chế tôm thịt và gia vị"),
    DishStep("3", "", "Luộc mì vàng"),
    DishStep("4", "", "Chuẩn bị rau và bánh tráng"),
    DishStep("5", "", "Trình bày mì với nước dùng đặc"),
  ],
  "D009": [
    // Cơm niêu
    DishStep("1", "", "Vo gạo và nấu trong nồi đất"),
    DishStep("2", "", "Kho cá với nước mắm"),
    DishStep("3", "", "Nấu canh chua"),
    DishStep("4", "", "Đảo cơm đến khi có cháy"),
    DishStep("5", "", "Lật úp nồi lên đĩa"),
  ],
  "D010": [
    // Bánh mì thịt
    DishStep("1", "", "Nướng bánh mì giòn"),
    DishStep("2", "", "Chuẩn bị patê và thịt nguội"),
    DishStep("3", "", "Thái rau và đồ chua"),
    DishStep("4", "", "Phết patê lên bánh"),
    DishStep("5", "", "Xếp thịt và rau vào bánh"),
  ],
  "D011": [
    // Bún riêu
    DishStep("1", "", "Làm riêu cua"),
    DishStep("2", "", "Nấu nước dùng"),
    DishStep("3", "", "Chiên đậu phụ"),
    DishStep("4", "", "Luộc bún tươi"),
    DishStep("5", "", "Trình bày với rau sống"),
  ],
  "D012": [
    // Chả cá Lã Vọng
    DishStep("1", "", "Ướp cá với nghệ và gia vị"),
    DishStep("2", "", "Chuẩn bị thì là và hành"),
    DishStep("3", "", "Nướng cá sơ qua"),
    DishStep("4", "", "Xào cá với thì là"),
    DishStep("5", "", "Dùng kèm bún và lạc"),
  ],
  "D013": [
    // Canh chua cá lóc
    DishStep("1", "", "Sơ chế cá lóc thành khúc"),
    DishStep("2", "", "Chuẩn bị rau củ cho canh"),
    DishStep("3", "", "Nấu nước dùng"),
    DishStep("4", "", "Cho cá vào nấu"),
    DishStep("5", "", "Nêm nếm và cho rau củ"),
  ],
  "D014": [
    // Gà nướng
    DishStep("1", "", "Ướp gà với sả ớt"),
    DishStep("2", "", "Để gà thấm gia vị 2 giờ"),
    DishStep("3", "", "Chuẩn bị than nướng"),
    DishStep("4", "", "Nướng gà đều hai mặt"),
    DishStep("5", "", "Làm muối ớt chanh"),
  ],
  "D015": [
    // Bò lúc lắc
    DishStep("1", "", "Thái thịt bò hạt lựu"),
    DishStep("2", "", "Ướp bò với tỏi và tiêu"),
    DishStep("3", "", "Xào bò trên lửa lớn"),
    DishStep("4", "", "Làm sốt tiêu đen"),
    DishStep("5", "", "Trình bày với salad"),
  ],
  "D016": [
    // Bánh cuốn
    DishStep("1", "", "Trộn bột bánh cuốn"),
    DishStep("2", "", "Làm nhân thịt nấm"),
    DishStep("3", "", "Tráng bánh mỏng"),
    DishStep("4", "", "Cuốn với nhân"),
    DishStep("5", "", "Làm nước mắm chua ngọt"),
  ],
  "D017": [
    // Cơm gà Hải Nam
    DishStep("1", "", "Luộc gà với gừng"),
    DishStep("2", "", "Nấu cơm với nước luộc gà"),
    DishStep("3", "", "Làm sốt gừng và tương"),
    DishStep("4", "", "Thái gà thành miếng"),
    DishStep("5", "", "Trình bày cơm và gà"),
  ],
  "D018": [
    // Hủ tiếu Nam Vang
    DishStep("1", "", "Nấu nước dùng xương"),
    DishStep("2", "", "Sơ chế tôm thịt"),
    DishStep("3", "", "Luộc hủ tiếu"),
    DishStep("4", "", "Chuẩn bị rau giá"),
    DishStep("5", "", "Trình bày và chan nước"),
  ],
  "D019": [
    // Lẩu thái
    DishStep("1", "", "Nấu nước lẩu chua cay"),
    DishStep("2", "", "Sơ chế hải sản"),
    DishStep("3", "", "Chuẩn bị rau nấm"),
    DishStep("4", "", "Bày trí nguyên liệu"),
    DishStep("5", "", "Nấu lẩu và thưởng thức"),
  ],
  "D020": [
    // Mực xào sa tế
    DishStep("1", "", "Làm sạch mực"),
    DishStep("2", "", "Ướp mực với sa tế"),
    DishStep("3", "", "Phi thơm tỏi ớt"),
    DishStep("4", "", "Xào mực trên lửa lớn"),
    DishStep("5", "", "Rắc tiêu và hành lá"),
  ],
  "D021": [
    // Cháo lòng
    DishStep("1", "", "Nấu cháo gạo"),
    DishStep("2", "", "Sơ chế lòng heo"),
    DishStep("3", "", "Luộc lòng"),
    DishStep("4", "", "Cho lòng vào cháo"),
    DishStep("5", "", "Thêm hành ngò và tiêu"),
  ],
  "D022": [
    // Sườn xào chua ngọt
    DishStep("1", "", "Ướp sườn với gia vị"),
    DishStep("2", "", "Chiên sườn vàng"),
    DishStep("3", "", "Xào ớt chuông"),
    DishStep("4", "", "Làm sốt chua ngọt"),
    DishStep("5", "", "Xào sườn với sốt"),
  ],
  "D023": [
    // Cá chiên mắm gừng
    DishStep("1", "", "Ướp cá với gừng"),
    DishStep("2", "", "Chiên cá vàng giòn"),
    DishStep("3", "", "Làm sốt mắm gừng"),
    DishStep("4", "", "Rưới sốt lên cá"),
    DishStep("5", "", "Trang trí với rau thơm"),
  ],
  "D024": [
    // Rau muống xào tỏi
    DishStep("1", "", "Nhặt rau muống"),
    DishStep("2", "", "Băm tỏi"),
    DishStep("3", "", "Đun nóng dầu"),
    DishStep("4", "", "Phi thơm tỏi"),
    DishStep("5", "", "Xào rau muống"),
  ],
  "D025": [
    // Cơm chiên dương châu
    DishStep("1", "", "Chuẩn bị cơm nguội"),
    DishStep("2", "", "Thái nhỏ các nguyên liệu"),
    DishStep("3", "", "Xào từng loại riêng"),
    DishStep("4", "", "Trộn đều với cơm"),
    DishStep("5", "", "Nêm nếm vừa ăn"),
  ],
  "D026": [
    // Gỏi đu đủ
    DishStep("1", "", "Bào đu đủ sợi"),
    DishStep("2", "", "Ngâm đu đủ với muối"),
    DishStep("3", "", "Rang lạc giòn"),
    DishStep("4", "", "Làm nước trộn"),
    DishStep("5", "", "Trộn đều các nguyên liệu"),
  ],
  "D027": [
    // Thịt kho tàu
    DishStep("1", "", "Ướp thịt với gia vị"),
    DishStep("2", "", "Luộc trứng"),
    DishStep("3", "", "Kho thịt với nước dừa"),
    DishStep("4", "", "Thêm trứng vào kho"),
    DishStep("5", "", "Kho liu riu đến khi sệt"),
  ],
  "D028": [
    // Cà ri gà
    DishStep("1", "", "Ướp gà với bột cà ri"),
    DishStep("2", "", "Phi thơm hành tỏi"),
    DishStep("3", "", "Nấu gà với nước cốt dừa"),
    DishStep("4", "", "Thêm khoai tây, cà rốt"),
    DishStep("5", "", "Nấu đến khi sệt"),
  ],
  "D029": [
    // Khổ qua xào trứng
    DishStep("1", "", "Thái khổ qua thành lát mỏng"),
    DishStep("2", "", "Luộc sơ khổ qua với muối"),
    DishStep("3", "", "Đánh trứng với gia vị"),
    DishStep("4", "", "Phi thơm tỏi"),
    DishStep("5", "", "Xào khổ qua với trứng"),
  ],
  "D030": [
    // Canh khổ qua nhồi thịt
    DishStep("1", "", "Làm sạch và bổ đôi khổ qua"),
    DishStep("2", "", "Trộn thịt băm với gia vị"),
    DishStep("3", "", "Nhồi thịt vào khổ qua"),
    DishStep("4", "", "Nấu nước dùng trong"),
    DishStep("5", "", "Nấu khổ qua nhồi thịt"),
  ],
};
