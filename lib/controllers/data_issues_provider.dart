import 'package:flutter/material.dart';

import '../repositories/issues_repository.dart';

class DataIssuesProvider extends ChangeNotifier {
  final IssuesRepository _dataIssuesRepository = IssuesRepository();
  bool _isLoading = true;
  String _errorMessage = '';
  int offset = 0;
  int limit = 20;

  Map _dataIssues = {};
  Map get dataIssues => _dataIssues;
  bool get isLoading => _isLoading;
  bool get hasError => _errorMessage.isNotEmpty;
  String get errorMessage => _errorMessage;

  Future<void> fetchDataIssues() async {
    print('fetchDataIssues');
    try {
      _dataIssues = await _dataIssuesRepository.fetchIssues(limit, offset);
    } catch (e) {
      _errorMessage = 'Error al cargar los datos: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMoreDataIssues() async {
    offset += limit;
    final moreDataIssues =
        await _dataIssuesRepository.fetchIssues(limit, offset);
    _dataIssues.addAll(moreDataIssues);
    notifyListeners();
  }
}
