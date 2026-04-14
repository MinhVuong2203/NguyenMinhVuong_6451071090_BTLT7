import 'package:nguyenminhvuong_api/data/models/user_models.dart';

import '../data/repository/user_repository.dart';

class UserController {
  final UserRepository _repository = UserRepository();

  Future<List<User>> fetchUsers() {
    return _repository.getUsers();
  }
}