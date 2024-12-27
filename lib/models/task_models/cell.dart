import 'package:freezed_annotation/freezed_annotation.dart';

part 'cell.freezed.dart';
part 'cell.g.dart';

@freezed
class Cell with _$Cell {
  const factory Cell({
    required int x,
    required int y,
    @JsonKey(includeToJson: false) @Default(false) bool isLocked,
    @JsonKey(includeToJson: false) @Default([]) List<Cell> path,
  }) = _Cell;

  factory Cell.fromJson(Map<String, dynamic> json) => _$CellFromJson(json);
}
