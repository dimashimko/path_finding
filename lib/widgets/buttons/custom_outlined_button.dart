import 'package:flutter/material.dart';
import 'package:path_finding/utils/app_typography.dart';

import '../../themes/app_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  const CustomOutlinedButton({
    super.key,
    this.onPressed,
    this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.lightBlue,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          disabledForegroundColor: AppColors.black.withValues(alpha: 0.3),
          padding: padding ?? const EdgeInsets.all(16.0),
          textStyle: AppTypography.buttonText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ).copyWith(
          side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
            if (states.contains(WidgetState.disabled)) {
              return BorderSide(
                color: AppColors.blueOutline.withValues(alpha: 0.3),
              );
            }

            return const BorderSide(
              color: AppColors.blueOutline,
              width: 2.0,
            );
          }),
        ),
        child: child,
      ),
    );
  }
}
