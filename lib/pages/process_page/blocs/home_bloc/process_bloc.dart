import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_finding/models/task_models/cell.dart';
import 'package:path_finding/models/task_models/result.dart';
import 'package:path_finding/models/task_models/task_result.dart';
import 'package:path_finding/pages/process_page/blocs/home_bloc/path_finder.dart';

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
    emit(
      state.copyWith(
        status: ProcessStatus.calculating,
        progress: 0,
      ),
    );

    List<TaskResult> resultList = [];
    for (Task task in state.taskList) {
      resultList.add(
        _calculatingTask(
          task,
        ),
      );
      emit(
        state.copyWith(
          progress: ((resultList.length / state.taskList.length) * 100).toInt(),
        ),
      );
    }

    emit(
      state.copyWith(
        status: ProcessStatus.ready,
        progress: 100,
        resultList: resultList,
      ),
    );
  }

  TaskResult _calculatingTask(Task task) {
    List<List<Cell>> matrix = _convertToMatrix(
      task.field,
    );
    PathFinder pathFinder = PathFinder(
      matrix: matrix,
      start: task.start,
      end: task.end,
    );

    return TaskResult(
      id: task.id,
      field: task.field,
      result: Result(
        steps: pathFinder.calculate(),
        path: '${task.start.toText}->${task.end.toText}',
      ),
    );
  }

  List<List<Cell>> _convertToMatrix(List<String> field) {
    final List<List<Cell>> matrix = [];

    for (int y = 0; y < field.length; y++) {
      final List<Cell> row = [];
      final String line = field[y];

      for (int x = 0; x < line.length; x++) {
        final String char = line[x];

        row.add(
          Cell(
            x: x,
            y: y,
            isLocked: char.isLocked,
          ),
        );
      }

      matrix.add(row);
    }

    return matrix;
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
