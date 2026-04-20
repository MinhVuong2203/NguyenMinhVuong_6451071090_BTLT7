import '../models/news_model.dart';
import '../service/news_service.dart';

class NewsRepository {
  final NewsService _service = NewsService();

  Future<List<NewsModel>> getNews() async {
    final data = await _service.fetchNews();
    return data.map(NewsModel.fromJson).toList();
  }
}