import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'task_result.freezed.dart';
part 'task_result.g.dart';

@freezed
class TaskResult with _$TaskResult {
  const factory TaskResult({
    required String id,
    required Result result,
  }) = _TaskResult;

  factory TaskResult.fromJson(Map<String, dynamic> json) =>
      _$TaskResultFromJson(json);
}
