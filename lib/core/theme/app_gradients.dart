import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  // Header Gradient
  static const LinearGradient header = LinearGradient(
    colors: [AppColors.gradientStart, AppColors.gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Accent Gradient
  static const LinearGradient accent = LinearGradient(
    colors: [AppColors.gradientAccentStart, AppColors.gradientAccentEnd],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );
}
