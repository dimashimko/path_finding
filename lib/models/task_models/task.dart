import 'package:freezed_annotation/freezed_annotation.dart';

import 'cell.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required List<String> field,
    required Cell start,
    required Cell end,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
