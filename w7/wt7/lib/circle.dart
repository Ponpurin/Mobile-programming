import 'dart:math';

class Circle {
  static areaCalculate({required int radius}) {
    double area = pi * radius * radius;
    return area;
  }

  static lenghtCalculate({required int radius}) {
    double lenght = 2 * pi * radius;
    return lenght;
  }
}
