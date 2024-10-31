import 'dart:ffi';

final class SubClass{
  static String convertTime(String time) {
    int minutes = int.parse(time);

    int hours = minutes ~/ 60;

    int remainingMinutes = minutes % 60;

    return "${hours} giờ ${remainingMinutes} phút";
  }
}