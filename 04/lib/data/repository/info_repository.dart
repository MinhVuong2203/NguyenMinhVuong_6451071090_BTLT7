import 'package:nguyenminhvuong_api/data/models/info.dart';
import 'package:nguyenminhvuong_api/data/service/info_service.dart';

class InfoRepository {
  final InfoService _service = InfoService();

  Future<Info> getInfo(String id) async {
    final data = await _service.getInfo(id);
    return Info.fromJson(data);
  }

  Future<Info> updateInfo(Info info) async {
    final data = await _service.updateInfo(info);
    return Info.fromJson(data);
  }
}

