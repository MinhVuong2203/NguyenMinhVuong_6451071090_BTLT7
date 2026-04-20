import 'package:nguyenminhvuong_api/data/models/post.dart';
import 'package:nguyenminhvuong_api/data/service/post_service.dart';

class PostRepository {
  final PostService _service = PostService();

  Future<Post> createPost({required String title, required String content}) async {
    final request = Post(id: '', title: title, content: content);
    final data = await _service.createPost(request);
    return Post.fromJson(data);
  }
}
