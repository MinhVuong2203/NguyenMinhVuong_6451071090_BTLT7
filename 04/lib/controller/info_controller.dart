import 'package:nguyenminhvuong_api/data/models/info.dart';
import 'package:nguyenminhvuong_api/data/repository/info_repository.dart';

class InfoController {
  final InfoRepository _repo = InfoRepository();

  Future<Info> fetchInfo(String id) {
    return _repo.getInfo(id);
  }

  Future<Info> updateInfo(Info info) {
    return _repo.updateInfo(info);
  }
}
