part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getTasks() = _GetTasks;

  const factory HomeEvent.editUrl({
    required final String newUrl,
  }) = _EditUrl;
}
