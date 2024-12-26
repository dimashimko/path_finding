import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/common_models/base_response.dart';
import '../../../../../utils/extensions.dart';
import '../../../../generated/l10n.dart';
import '../../../../models/task_models/task.dart';
import '../../../../repos/data_repo/data_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DataRepository dataRepository;

  HomeBloc({
    required this.dataRepository,
  }) : super(const HomeState()) {
    on<_GetTasks>(_onGetTasks);
    on<_EditUrl>(_onEditUrl);
  }

  void _onEditUrl(
    _EditUrl event,
    Emitter<HomeState> emit,
  ) {
    emit(
      HomeState(
        url: event.newUrl,
      ),
    );
  }

  void _onGetTasks(
    _GetTasks event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: HomeStatus.loading,
        ),
      );

      final BaseResponse<List<Task>> tasksResponse =
          await dataRepository.getTasks(
        url: state.url,
      );

      emit(
        state.copyWith(
          status: HomeStatus.success,
          taskList: tasksResponse.data,
        ),
      );
    } on DioException catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          error: e.text,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          error: S.current.unknownError,
        ),
      );
    }
  }
}
