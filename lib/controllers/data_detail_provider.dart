import 'package:flutter/material.dart';

import '../repositories/repositories.dart';

class DataDetailIssueProvider extends ChangeNotifier {
  final IssueDetailRepository _dataDetailRepository = IssueDetailRepository();
  bool _isLoading = true;
  String _errorMessage = '';
  String _title = '';
  String _url = '';

  Map _dataDetailModel = {};
  Map get dataDetailModel => _dataDetailModel;
  bool get isLoading => _isLoading;
  bool get hasError => _errorMessage.isNotEmpty;
  String get errorMessage => _errorMessage;
  String get title => _title;

  set setUrl(String url) {
    _url = url;
  }

  set setTitle(String title) {
    _title = title;
  }

  Future<void> fetchDataDetail() async {
    _isLoading = true;
    try {
      _dataDetailModel = await _dataDetailRepository.getIssueDetail(_url);
    } catch (e) {
      _errorMessage = 'Error al cargar los datos: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
