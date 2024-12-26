import 'package:freezed_annotation/freezed_annotation.dart';

part 'cell.freezed.dart';
part 'cell.g.dart';

@freezed
class Cell with _$Cell {
  const factory Cell({
    required int x,
    required int y,
  }) = _Cell;

  factory Cell.fromJson(Map<String, dynamic> json) => _$CellFromJson(json);
}
