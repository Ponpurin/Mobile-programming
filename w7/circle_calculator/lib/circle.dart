import 'dart:math' show pi;

class Circle {
  static double calculateArea({required int radius}) {
    double area = pi * radius * radius;
    return area;
  }

  static double calculateLength({required int radius}) {
    double lenght = 2 * pi * radius;
    return lenght;
  }
}
