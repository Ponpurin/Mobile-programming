class BMI {
  static double calculate({required int weight, required int height}) {
    double heightCM = (height / 100);
    double bmi = weight / (heightCM * heightCM);
    return bmi;
  }

  static String category({required double bmi}) {
    if (bmi < 16.0) return "Underweight (Server Thinness)";
    if (bmi <= 16.9 && bmi > 16.0) return "Underweight (Moderate thinness)";
    if (bmi <= 18.4 && bmi >= 17) return "Underweight (Mild thinness)";
    if (bmi <= 24.9 && bmi >= 18.5) return "Normal range";
    if (bmi <= 29.9 && bmi >= 25) return "Overweight (Pre-obese)";
    if (bmi <= 34.9 && bmi >= 30.0) return "Obese (Class I)";
    if (bmi <= 39.9 && bmi >= 35.0) return "Obese (Class II)";
    return "Obess (Class III)";
  }
}
