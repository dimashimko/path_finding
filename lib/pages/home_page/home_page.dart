import 'package:flutter/material.dart';
import 'package:path_finding/themes/app_colors.dart';

import '../../generated/l10n.dart';
import '../../widgets/common/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    S tr = S.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: AppColors.blue,
        title: Text(
          tr.homeScreen,
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      body: Center(
        child: Text(tr.homePage),
      ),
    );
  }
}
