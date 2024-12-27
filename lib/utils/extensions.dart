import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_finding/themes/app_colors.dart';

import '../generated/l10n.dart';
import '../models/common_models/base_response.dart';
import '../models/task_models/cell.dart';

extension ListCellX on List<Cell> {
  Color getColor(int row, int col, bool isLocked) {
    if (isLocked) return AppColors.cellLocked;
    if (isEmpty) return AppColors.cellEmpty;
    if (first.x == col && first.y == row) return AppColors.cellInitial;
    if (last.x == col && last.y == row) return AppColors.cellEnd;
    for (int i = 1; i < length - 1; i++) {
      if (this[i].x == col && this[i].y == row) {
        return AppColors.cellShortestPath;
      }
    }

    return AppColors.cellEmpty;
  }

  String getPath() {
    return map(
      (Cell cell) => cell.toText,
    ).toList().join('->');
  }
}

extension CellX on Cell {
  String get toText => '($x,$y)';
}

extension StringX on String {
  bool get isLocked => this == 'X';
}

extension DioExceptionX on DioException {
  String get text {
    try {
      switch (type) {
        case DioExceptionType.badResponse:
          if (response != null) {
            final BaseResponse baseResponse = BaseResponse.fromJson(
              response!.data,
              (json) => json,
            );

            if (baseResponse.error) {
              return baseResponse.message;
            } else {
              return S.current.unknownError;
            }
          } else {
            return '$message';
          }
        default:
          return type.name;
      }
    } catch (_) {
      return S.current.unknownError;
    }
  }
}
