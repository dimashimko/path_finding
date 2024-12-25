part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getData({
    @Default(false) bool refresh,
  }) = _GetData;
}
