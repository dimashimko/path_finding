import 'package:flutter/material.dart';
import 'package:path_finding/models/task_models/task_result.dart';
import 'package:path_finding/utils/extensions.dart';

import '../../generated/l10n.dart';
import '../../themes/app_colors.dart';
import '../../utils/app_typography.dart';
import '../../widgets/common/custom_app_bar.dart';
import 'widgets/custom_route_grid.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({
    super.key,
    required this.taskResult,
  });

  final TaskResult taskResult;

  @override
  Widget build(BuildContext context) {
    S tr = S.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.blue,
          title: Text(
            tr.previewScreen,
            style: AppTypography.appBarTitle,
          ),
        ),
        body: Column(
          children: [
            if (taskResult.field.isNotEmpty)
              CustomRouteGrid(
                field: taskResult.field,
                steps: taskResult.result.steps,
              ),
            Text(
              taskResult.result.steps.getPath(),
              style: AppTypography.simpleText,
            ),
          ],
        ),
      ),
    );
  }
}
