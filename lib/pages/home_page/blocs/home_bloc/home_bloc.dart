import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/common_models/base_response.dart';
import '../../../../../utils/extensions.dart';
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
    on<_GetData>(_onGetData);
  }

  void _onGetData(
    _GetData event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final BaseResponse<List<Task>> tasksResponse =
          await dataRepository.getTasks(
        url: event.refresh.toString(),
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
    }
  }
}
