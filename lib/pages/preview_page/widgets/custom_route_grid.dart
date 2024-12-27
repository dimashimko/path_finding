import 'package:flutter/material.dart';
import 'package:path_finding/utils/extensions.dart';

import '../../../models/task_models/cell.dart';
import '../../../themes/app_colors.dart';

class CustomRouteGrid extends StatelessWidget {
  final List<String> field;
  final List<Cell> steps;

  const CustomRouteGrid({
    super.key,
    required this.field,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final int rows = field.length;
    final int cols = field.firstOrNull?.length ?? 0;
    final screenWidth = MediaQuery.of(context).size.width;
    final squareSize = screenWidth / cols;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        rows,
        (row) {
          List<String> letters = field[row].split('');
          return Row(
            children: List.generate(
              cols,
              (col) {
                bool isLocked = letters[col].isLocked;
                Color color = steps.getColor(row, col, isLocked);
                return SizedBox(
                  width: squareSize,
                  height: squareSize,
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      border: Border.all(
                        color: AppColors.black,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        // '($row, $col)',
                        '($col, $row)',
                        style: TextStyle(
                          color: letters[col].isLocked
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
