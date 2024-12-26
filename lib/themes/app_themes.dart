import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  const AppThemes._();

  static final ThemeData lightTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    scaffoldBackgroundColor: AppColors.grayFA,
    colorScheme: ColorScheme.light(
      primary: AppColors.black,
      // primary: Colors.red,
      // surface: Colors.green,
      surfaceTint: Colors.purple,
    ),
  );
}
