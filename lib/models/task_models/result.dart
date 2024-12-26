import 'package:freezed_annotation/freezed_annotation.dart';

import 'cell.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Result with _$Result {
  const factory Result({
    required List<Cell> steps,
    required String path,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
