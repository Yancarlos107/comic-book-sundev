import 'package:flutter/material.dart';

import '../domain/domains.dart';
import '../repositories/repositories.dart';

class DataDetailIssueProvider extends ChangeNotifier {
  final IssueDetailRepository _dataDetailRepository = IssueDetailRepository();
  bool _isLoading = true;
  String _errorMessage = '';
  String _title = '';
  String _url = '';

  IssueDetailResult _dataDetailModel = IssueDetailResult(
      error: '',
      statusCode: 0,
      results: null,
      version: '',
      limit: 0,
      offset: 0,
      numberOfPageResults: 0,
      numberOfTotalResults: 0);
  IssueDetailResult get dataDetailModel => _dataDetailModel;
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
