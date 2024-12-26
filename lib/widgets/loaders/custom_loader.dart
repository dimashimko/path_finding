import 'package:flutter/material.dart';
import 'package:path_finding/themes/app_colors.dart';

class CustomLoader extends StatelessWidget {
  final double size;
  final double strokeWidth;

  const CustomLoader({
    super.key,
    this.size = 80.0,
    this.strokeWidth = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          color: AppColors.blue,
        ),
      ),
    );
  }
}
