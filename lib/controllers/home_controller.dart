import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int _count = 1;
  double _ratio = 2.0;
  ViewType _viewType = ViewType.list;

  int get count => _count;
  double get ratio => _ratio;
  ViewType get viewType => _viewType;

  set count(int value) {
    _count = value;
  }

  set ratio(double value) {
    _ratio = value;
  }

  set viewType(ViewType value) {
    _viewType = value;
  }

  changeGrid(int count, double ratio, int grid) {
    this.count = count;
    this.ratio = ratio;
    viewType = ViewType.values[grid];
    notifyListeners();
  }
}

enum ViewType { list, grid }
