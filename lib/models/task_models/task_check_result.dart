import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_check_result.freezed.dart';
part 'task_check_result.g.dart';

@freezed
class TaskCheckResult with _$TaskCheckResult {
  const factory TaskCheckResult({
    required String id,
    required bool correct,
  }) = _TaskCheckResult;

  factory TaskCheckResult.fromJson(Map<String, dynamic> json) =>
      _$TaskCheckResultFromJson(json);
}
