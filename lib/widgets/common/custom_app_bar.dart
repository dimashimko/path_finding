import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_finding/themes/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.backgroundColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: title,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.darkBlue,
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.dark, // For iOS (dark icons)
      ),
    );
  }
}
