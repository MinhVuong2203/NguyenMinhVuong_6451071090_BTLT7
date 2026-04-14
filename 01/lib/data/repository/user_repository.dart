import 'package:nguyenminhvuong_api/data/models/user_models.dart';
import 'package:nguyenminhvuong_api/data/service/user_service.dart';

class UserRepository {
  final UserService _service = UserService();

  Future<List<User>> getUsers() async {
    final data = await _service.fetchUser();
    return data.map((e) => User.fromJson(e)).toList();
  }
}
