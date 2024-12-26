import 'package:flutter/material.dart';

import '../../../models/task_models/task_result.dart';
import '../../../utils/app_typography.dart';

class ResultListCard extends StatelessWidget {
  const ResultListCard({
    super.key,
    required this.taskResult,
    required this.onTap,
  });

  final TaskResult taskResult;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            taskResult.result.path,
            style: AppTypography.simpleText.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
