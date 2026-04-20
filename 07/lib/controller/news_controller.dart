import 'package:flutter/foundation.dart';
import 'package:nguyenminhvuong_api/data/models/news_model.dart';
import 'package:nguyenminhvuong_api/data/repository/news_repository.dart';

class NewsController extends ChangeNotifier {
  final NewsRepository _repo = NewsRepository();

  List<NewsModel> items = <NewsModel>[];
  bool isLoading = false;
  String? errorMessage;

  // load lần đầu
  Future<void> fetchNews() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      items = await _repo.getNews();
    } catch (e) {
      items = <NewsModel>[];
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // pull to refresh
  Future<void> refresh() async {
    try {
      final data = await _repo.getNews();
      items = data;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}