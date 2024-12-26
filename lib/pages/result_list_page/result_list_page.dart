import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_finding/models/task_models/task_result.dart';
import 'package:path_finding/pages/result_list_page/widgets/result_list_card.dart';

import '../../generated/l10n.dart';
import '../../routes/app_router.dart';
import '../../themes/app_colors.dart';
import '../../utils/app_typography.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/custom_divider.dart';

class ResultListPage extends StatelessWidget {
  const ResultListPage({
    super.key,
    required this.resultList,
  });

  final List<TaskResult> resultList;

  void _goToPreviewScreen({
    required BuildContext context,
    required TaskResult taskResult,
  }) async {
    await context.push(
      PreviewRoute().location,
      extra: taskResult,
    );
  }

  @override
  Widget build(BuildContext context) {
    S tr = S.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.blue,
          title: Text(
            tr.resultListScreen,
            style: AppTypography.appBarTitle,
          ),
        ),
        body: ListView.separated(
          itemCount: resultList.length,
          separatorBuilder: (BuildContext context, int index) {
            return CustomDivider();
          },
          itemBuilder: (BuildContext context, int index) {
            return ResultListCard(
              taskResult: resultList[index],
              onTap: () {
                _goToPreviewScreen(
                  context: context,
                  taskResult: resultList[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
