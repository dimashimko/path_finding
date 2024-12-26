part of 'process_bloc.dart';

@freezed
class ProcessEvent with _$ProcessEvent {
  const factory ProcessEvent.calculation() = _Calculation;

  const factory ProcessEvent.sendResults() = _SendResults;
}
