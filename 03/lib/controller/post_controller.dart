import 'package:nguyenminhvuong_api/data/models/post.dart';
import 'package:nguyenminhvuong_api/data/repository/post_repository.dart';

class PostController {
  final PostRepository _repo = PostRepository();

  Future<Post> createPost({required String title, required String content}) {
    return _repo.createPost(title: title, content: content);
  }
}
