import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_finding/models/task_models/cell.dart';
import 'package:path_finding/models/task_models/result.dart';
import 'package:path_finding/models/task_models/task_result.dart';

import '../../../../../models/common_models/base_response.dart';
import '../../../../../utils/extensions.dart';
import '../../../../generated/l10n.dart';
import '../../../../models/task_models/task.dart';
import '../../../../models/task_models/task_check_result.dart';
import '../../../../repos/data_repo/data_repository.dart';

part 'process_bloc.freezed.dart';
part 'process_event.dart';
part 'process_state.dart';

class ProcessBloc extends Bloc<ProcessEvent, ProcessState> {
  final DataRepository dataRepository;
  final List<Task> taskList;

  ProcessBloc({
    required this.dataRepository,
    required this.taskList,
  }) : super(
          ProcessState(
            taskList: taskList,
          ),
        ) {
    on<_Calculation>(_onCalculation);
    on<_SendResults>(_onSendResults);
  }

  void _onCalculation(
    _Calculation event,
    Emitter<ProcessState> emit,
  ) async {
    const totalDuration = 1;
    const steps = 100;
    const stepDuration = totalDuration / steps;

    emit(
      state.copyWith(
        status: ProcessStatus.calculating,
        progress: 0,
      ),
    );

    for (int i = 0; i <= steps; i++) {
      await Future.delayed(
        Duration(
          milliseconds: (stepDuration * 1000).toInt(),
        ),
      );
      emit(
        state.copyWith(
          progress: i,
        ),
      );
    }

    emit(
      state.copyWith(
        status: ProcessStatus.ready,
        progress: 100,
        resultList: [
          TaskResult(
            id: '7d785c38-cd54-4a98-ab57-44e50ae646c1',
            field: [
              ".X.",
              ".X.",
              "...",
            ],
            result: Result(
              steps: [
                Cell(
                  x: 2,
                  y: 1,
                ),
                Cell(
                  x: 1,
                  y: 2,
                ),
                Cell(
                  x: 0,
                  y: 2,
                ),
              ],
              path: '(2,1)->(1,2)->(0,2)',
            ),
          ),
          TaskResult(
            id: '88746d24-bf68-4dea-a6b6-4a8fefb47eb9',
            field: [
              "XXX.",
              "X..X",
              "X..X",
              ".XXX",
            ],
            result: Result(
              steps: [
                Cell(
                  x: 0,
                  y: 3,
                ),
                Cell(
                  x: 1,
                  y: 2,
                ),
                Cell(
                  x: 2,
                  y: 1,
                ),
                Cell(
                  x: 3,
                  y: 0,
                ),
              ],
              path: '(0,3)->(3,0)',
            ),
          ),
        ],
      ),
    );
  }

  void _onSendResults(
    _SendResults event,
    Emitter<ProcessState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: ProcessStatus.loading,
        ),
      );

      final BaseResponse<List<TaskCheckResult>> taskCheckResponse =
          await dataRepository.sendResults(
        resultList: state.resultList,
      );
      if (taskCheckResponse.data.where((e) => !e.correct).toList().isEmpty) {
        emit(
          state.copyWith(
            status: ProcessStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: ProcessStatus.failure,
            error: S.current.wrongDecision,
          ),
        );
      }
    } on DioException catch (e) {
      emit(
        state.copyWith(
          status: ProcessStatus.failure,
          error: e.text,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProcessStatus.failure,
          error: S.current.unknownError,
        ),
      );
    }
  }
}
