import 'package:flutter/material.dart';

import '../repositories/repositories.dart';

class DataDetailIssueProvider extends ChangeNotifier {
  final IssueDetailRepository _dataDetailRepository = IssueDetailRepository();
  bool _isLoading = true;
  String _errorMessage = '';

  Map _dataDetailModel = {};
  Map get dataDetailModel => _dataDetailModel;
  bool get isLoading => _isLoading;
  bool get hasError => _errorMessage.isNotEmpty;
  String get errorMessage => _errorMessage;

  Future<void> fetchDataDetail(String id) async {
    print('fetching data detail');
    _isLoading = true;
    try {
      _dataDetailModel = await _dataDetailRepository.getIssueDetail(id);
    } catch (e) {
      _errorMessage = 'Error al cargar los datos: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
