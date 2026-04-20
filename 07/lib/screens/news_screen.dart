import 'package:flutter/material.dart';
import '../data/models/news_model.dart';
import '../data/repository/news_repository.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsRepository _repository = NewsRepository();

  List<NewsModel> _news = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  Future<void> _loadNews() async {
    try {
      final data = await _repository.getNews();
      setState(() => _news = data);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => _isLoading = false);
  }

  // 🔥 Pull to refresh
  Future<void> _refresh() async {
    final data = await _repository.getNews();
    setState(() => _news = data);
  }

  Widget _buildItem(NewsModel item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(
          item.image,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Icon(Icons.image),
        ),
        title: Text(item.title),
        subtitle: Text(item.author),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: _refresh,
        child: _news.isEmpty
            ? const Center(child: Text("No news"))
            : ListView.builder(
          itemCount: _news.length,
          itemBuilder: (context, index) {
            return _buildItem(_news[index]);
          },
        ),
      ),
    );
  }
}