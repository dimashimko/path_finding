import '../../../../models/task_models/cell.dart';

class PathFinder {
  List<List<Cell>> matrix;
  Cell start;
  Cell end;
  List<List<bool>> map = [];
  List<Cell> neighbors = [];
  List<Cell> newNeighbors = [];
  final directions = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1],
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
  ];

  PathFinder({
    required this.matrix,
    required this.start,
    required this.end,
  });

  List<Cell> calculate() {
    _fillMap();

    neighbors.add(start);
    map[start.y][start.x] = true;

    while (true) {
      newNeighbors = _getNewNeighbors(neighbors);
      if (newNeighbors.isEmpty) break;
      neighbors = [...newNeighbors];
      newNeighbors = [];
    }
    return [
      ...matrix[end.y][end.x].path,
      end,
    ];
  }

  List<Cell> _getNewNeighbors(List<Cell> neighbors) {
    List<Cell> newNeighbors = [];
    for (Cell cell in neighbors) {
      newNeighbors.addAll(
        _getNewNeighborsForCell(
          cell,
        ),
      );
    }
    return newNeighbors;
  }

  Iterable<Cell> _getNewNeighborsForCell(Cell cell) {
    final neighbors = <Cell>[];

    for (var direction in directions) {
      final newX = cell.x + direction[0];
      final newY = cell.y + direction[1];

      if (newY >= 0 &&
          newY < matrix.length &&
          newX >= 0 &&
          newX < matrix[newY].length) {
        if (map[newY][newX] == false) {
          map[newY][newX] = true;
          List<Cell> newPath = [
            ...cell.path,
            cell,
          ];

          neighbors.add(
            matrix[newY][newX] = matrix[newY][newX].copyWith(
              path: newPath,
            ),
          );
        }
      }
    }

    return neighbors;
  }

  void _fillMap() {
    map = matrix
        .map(
          (rows) => rows.map((cell) => cell.isLocked).toList(),
        )
        .toList();
  }
}
