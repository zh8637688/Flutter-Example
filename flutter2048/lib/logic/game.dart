import 'dart:math';
import 'matrixUtil.dart';

Random _random = new Random();

List<int> initChess() {
  List<int> chess = [
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0
  ];
  _randomChess(chess, true);
  _randomChess(chess, true);
  return chess;
}

flingTo(List<int> chess, int direction) {
  bool canMove = false;
  List<int> tempChess = _transform(chess, direction);
  int n = sqrt(chess.length).toInt();
  int score = 0;
  for (int i = 0; i < n; i++) {
    for (int j = n - 1; j >= 0; j--) {
      int index = i * n + j;
      int destPos = _findDestPos(tempChess, index);
      if (destPos >= 0) {
        canMove = true;
        if (tempChess[destPos] > 0) {
          score += _mergeTo(tempChess, index, destPos);
        } else {
          _moveTo(tempChess, index, destPos);
        }
      }
    }
  }
  chess = _recovery(tempChess, direction);

  if (canMove) {
    _randomChess(chess, false);
  }
  return {
    'score': score,
    'chess': chess
  };
}

int _findDestPos(chess, srcPos) {
  int dest = -1;
  if (chess[srcPos] > 0) {
    int n = sqrt(chess.length).toInt();
    int row = (srcPos / n).floor();
    int column = srcPos % n;
    int lastIndex = -1;
    for (int i = n - 1; i > column; i--) {
      int index = row * n + i;
      if (chess[index] > 0) {
        lastIndex = index;
      } else {
        dest = index;
        break;
      }
    }
    if (lastIndex >= 0 && chess[lastIndex] > 0
        && (chess[lastIndex] == chess[srcPos])) {
      dest = lastIndex;
    }
  }
  return dest;
}

_mergeTo(chess, fromPos, toPos) {
  var to = chess[toPos];
  chess[fromPos] = 0;
  chess[toPos] = to * 2;
  return chess[toPos];
}

_moveTo(chess, fromPos, toPos) {
  chess[toPos] = chess[fromPos];
  chess[fromPos] = 0;
}

_transform(chess, direction) {
  switch (direction) {
    case 0:
      return chess;
    case 1:
      return MatrixUtil.flipLR(chess);
    case 2:
      return MatrixUtil.rot(chess);
    case 3:
      return MatrixUtil.inv(chess);
  }
}

_recovery(chess, direction) {
  switch (direction) {
    case 0:
      return chess;
    case 1:
      return MatrixUtil.flipLR(chess);
    case 2:
      return MatrixUtil.antiRot(chess);
    case 3:
      return MatrixUtil.inv(chess);
  }
}

_randomChess(chess, bool firstTime) {
  int rap = _randomAvailablePos(chess);
  int twoOrFour = firstTime || _random.nextDouble() < 0.9 ? 2 : 4;
  chess[rap] = twoOrFour;
}

int _randomAvailablePos(chess) {
  List<int> ap = _availablePos(chess);
  int pos = (_random.nextDouble() * ap.length).floor();
  return ap[pos];
}

List<int> _availablePos(chess) {
  List<int> ap = [];
  for (int i = 0; i < chess.length; i++) {
    if (chess[i] == 0) {
      ap.add(i);
    }
  }
  return ap;
}