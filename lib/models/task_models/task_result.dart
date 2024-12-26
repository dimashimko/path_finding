import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'task_result.freezed.dart';
part 'task_result.g.dart';

@freezed
class TaskResult with _$TaskResult {
  const factory TaskResult({
    required final String id,
    required final Result result,
    @JsonKey(includeToJson: false) required final List<String> field,
  }) = _TaskResult;

  factory TaskResult.fromJson(Map<String, dynamic> json) =>
      _$TaskResultFromJson(json);
}
