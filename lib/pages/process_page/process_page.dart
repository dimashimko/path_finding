import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path_finding/routes/app_router.dart';
import 'package:path_finding/themes/app_colors.dart';
import 'package:path_finding/utils/app_typography.dart';

import '../../generated/l10n.dart';
import '../../models/task_models/task.dart';
import '../../repos/data_repo/data_repository.dart';
import '../../widgets/buttons/custom_outlined_button.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/custom_divider.dart';
import '../../widgets/loaders/custom_loader.dart';
import 'blocs/home_bloc/process_bloc.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  State<ProcessPage> createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
  @override
  Widget build(BuildContext context) {
    S tr = S.of(context);
    return BlocProvider(
      create: (context) => ProcessBloc(
        dataRepository: context.read<DataRepository>(),
        taskList: widget.taskList,
      )..add(
          ProcessEvent.calculation(),
        ),
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            backgroundColor: AppColors.blue,
            title: Text(
              tr.processScreen,
              style: AppTypography.appBarTitle,
            ),
          ),
          body: BlocConsumer<ProcessBloc, ProcessState>(
            listenWhen: (p, c) => p.status != c.status,
            listener: (context, state) async {
              if (state.status.isSuccess) {
                await context.push(
                  ResultListRoute().location,
                  extra: state.resultList,
                );
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              if (!state.status.isCalculating)
                                Text(
                                  tr.allCalculationHasFinished,
                                  style: AppTypography.simpleText,
                                  textAlign: TextAlign.center,
                                ),
                              Text(
                                '${state.progress}%',
                                style: AppTypography.simpleText,
                              ),
                            ],
                          ),
                        ),
                        CustomDivider(),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: state.status.isFailure
                              ? Text(
                                  state.error,
                                  style: AppTypography.errorText,
                                )
                              : CustomLoader(
                                  value: state.status.isLoading
                                      ? null
                                      : state.progress / 100,
                                ),
                        ),
                      ],
                    ),
                  ),
                  if (!state.status.isCalculating)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomOutlinedButton(
                        onPressed: state.status.isLoading
                            ? null
                            : () {
                                context.read<ProcessBloc>().add(
                                      ProcessEvent.sendResults(),
                                    );
                              },
                        child: Text(
                          tr.sendResultToServer,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
