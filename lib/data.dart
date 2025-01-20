import 'package:flutter/material.dart';

class data {
  static List<String> _harfNotlari() {
    return ['AA', 'BA', 'BB', 'CB', 'DC', 'DD', 'FD', 'FF'];
  }

  static double _notlar(String harf) {
    switch (harf) {
      case 'AA':
        return 4.0;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'DC':
        return 2.0;
      case 'DD':
        return 1.5;
      case 'FD':
        return 1.0;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> harfNotlari() {
    return _harfNotlari()
        .map(
          (e) => DropdownMenuItem(
            value: _notlar(e),
            child: Text(e),
          ),
        )
        .toList();
  }
}
