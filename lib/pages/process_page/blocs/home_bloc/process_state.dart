part of 'process_bloc.dart';

enum ProcessStatus {
  loading,
  calculating,
  ready,
  success,
  failure,
}

extension ProcessStatusX on ProcessStatus {
  bool get isLoading => this == ProcessStatus.loading;
  bool get isCalculating => this == ProcessStatus.calculating;
  bool get isReady => this == ProcessStatus.ready;
  bool get isSuccess => this == ProcessStatus.success;
  bool get isFailure => this == ProcessStatus.failure;
}

@freezed
class ProcessState with _$ProcessState {
  const factory ProcessState({
    @Default(ProcessStatus.calculating) ProcessStatus status,
    @Default([]) List<Task> taskList,
    @Default(100) int progress,
    @Default([]) List<TaskResult> resultList,
    @Default('') String error,
  }) = _ProcessState;
}
