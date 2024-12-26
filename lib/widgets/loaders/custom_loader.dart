import 'package:flutter/material.dart';
import 'package:path_finding/themes/app_colors.dart';

class CustomLoader extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final double? value;

  const CustomLoader({
    super.key,
    this.size = 80.0,
    this.strokeWidth = 4.0,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: CircularProgressIndicator(
          value: value,
          strokeWidth: strokeWidth,
          color: AppColors.blue,
        ),
      ),
    );
  }
}
