import 'dart:math';

class MatrixUtil {

  // 矩阵左右交换
  static List<int> flipLR(List<int> matrix) {
    int n = sqrt(matrix.length).toInt();
    List<int> newMatrix = [];
    for (int i = 0; i < n; i++) {
      for (int j = n - 1; j >= 0; j--) {
        newMatrix.add(matrix[i * n + j]);
      }
    }
    return newMatrix;
  }

  // 矩阵求逆
  static List<int> inv(List<int> matrix) {
    int n = sqrt(matrix.length).toInt();
    List<int> newMatrix = [];
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        newMatrix.add(matrix[j * n + i]);
      }
    }
    return newMatrix;
  }

  // 顺时针旋转
  static List<int> rot(List<int> matrix) {
    int n = sqrt(matrix.length).toInt();
    List<int> newMatrix = [];
    for (int i = 0; i < n; i++) {
      for (int j = n - 1; j >= 0; j--) {
        newMatrix.add(matrix[j * n + i]);
      }
    }
    return newMatrix;
  }

  // 逆时针旋转
  static List<int> antiRot(List<int> matrix) {
    int n = sqrt(matrix.length).toInt();
    List<int> newMatrix = [];
    for (int i = n - 1; i >= 0; i--) {
      for (int j = 0; j < n; j++) {
        newMatrix.add(matrix[j * n + i]);
      }
    }
    return newMatrix;
  }
}