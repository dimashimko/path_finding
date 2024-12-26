import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.0,
      color: AppColors.grayE7,
    );
  }
}
