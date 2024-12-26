import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:path_finding/models/task_models/cell.dart';
import 'package:path_finding/models/task_models/task.dart';
import 'package:path_finding/themes/app_colors.dart';
import 'package:path_finding/utils/app_typography.dart';

import '../../generated/l10n.dart';
import '../../repos/data_repo/data_repository.dart';
import '../../routes/app_router.dart';
import '../../widgets/buttons/custom_outlined_button.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/loaders/custom_loader.dart';
import 'blocs/home_bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    S tr = S.of(context);
    return BlocProvider(
      create: (context) => HomeBloc(
        dataRepository: context.read<DataRepository>(),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            backgroundColor: AppColors.blue,
            title: Text(
              tr.homeScreen,
              style: AppTypography.appBarTitle,
            ),
          ),
          body: BlocConsumer<HomeBloc, HomeState>(
            listenWhen: (p, c) => p.status != c.status,
            listener: (context, state) async {
              if (state.status.isSuccess) {
                await context.push(
                  ProcessPageRoute().location,
                  extra: state.taskList,
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr.setValidApi,
                      style: AppTypography.simpleText,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.sync_alt_outlined,
                        ),
                        Gap(16.0),
                        Expanded(
                          child: TextFormField(
                            controller: _controller,
                            onChanged: (String newValue) {
                              context.read<HomeBloc>().add(
                                    HomeEvent.editUrl(
                                      newUrl: newValue,
                                    ),
                                  );
                            },
                          ),
                        ),
                      ],
                    ),
                    Gap(16.0),
                    ElevatedButton(
                      onPressed: () {
                        String testUrl =
                            'https://flutter.webspark.dev/flutter/api';
                        _controller.text = testUrl;
                        context.read<HomeBloc>().add(
                              HomeEvent.editUrl(
                                newUrl: testUrl,
                              ),
                            );
                      },
                      child: Text(
                        'Past target URL (Dev button)',
                      ),
                    ),
                    Gap(16.0),
                    ElevatedButton(
                      onPressed: () {
                        context.push(
                          ProcessPageRoute().location,
                          extra: [
                            Task(
                              id: '7d785c38-cd54-4a98-ab57-44e50ae646c1',
                              field: [
                                ".X.",
                                ".X.",
                                "...",
                              ],
                              start: Cell(
                                x: 2,
                                y: 1,
                              ),
                              end: Cell(
                                x: 0,
                                y: 2,
                              ),
                            ),
                            Task(
                              id: '88746d24-bf68-4dea-a6b6-4a8fefb47eb9',
                              field: [
                                "XXX.",
                                "X..X",
                                "X..X",
                                ".XXX",
                              ],
                              start: Cell(
                                x: 0,
                                y: 3,
                              ),
                              end: Cell(
                                x: 3,
                                y: 0,
                              ),
                            ),
                          ],
                        );
                      },
                      child: Text(
                        'Push custom tasks (Dev button)',
                      ),
                    ),
                    if (state.status.isFailure)
                      Text(
                        state.error,
                        style: AppTypography.errorText,
                      ),
                    Expanded(
                      child: Center(
                        child: state.status.isLoading
                            ? CustomLoader()
                            : SizedBox(),
                      ),
                    ),
                    CustomOutlinedButton(
                      onPressed: state.url.isEmpty || state.status.isLoading
                          ? null
                          : () {
                              context.read<HomeBloc>().add(
                                    HomeEvent.getTasks(),
                                  );
                            },
                      child: Text(
                        tr.startCountingProcess,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
