import '../dummy/CommentDish.dart';
import '../dummy/MaterialDish.dart';
import '../dummy/StepDish.dart';
import '../page/DetailDish.dart';
import 'DishComment.dart';
import 'DishMaterial.dart';
import 'DishStep.dart';

class DummyDataHelper {
  static List<DishMaterial> getMaterials(String dishId) {
    return materialsByDish[dishId] ?? [];
  }

  static List<DishStep> getSteps(String dishId) {
    return stepsByDish[dishId] ?? [];
  }

  static List<DishComment> getComments(String dishId) {
    return commentsByDish[dishId] ?? [];
  }
}