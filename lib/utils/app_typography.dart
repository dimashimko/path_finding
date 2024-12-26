import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import 'app_fonts.dart';

class AppTypography {
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 20.0,
    color: AppColors.white,
    fontWeight: AppFonts.medium,
  );

  static const TextStyle simpleText = TextStyle(
    fontSize: 18.0,
    color: AppColors.black,
  );

  static const TextStyle errorText = TextStyle(
    fontSize: 18.0,
    color: AppColors.red,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 14.0,
    color: AppColors.black,
    fontWeight: AppFonts.bold,
  );
}
