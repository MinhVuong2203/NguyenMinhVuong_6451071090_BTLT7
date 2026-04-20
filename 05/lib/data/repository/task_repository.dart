import 'package:nguyenminhvuong_api/data/models/task_model.dart';
import 'package:nguyenminhvuong_api/data/service/task_service.dart';

class TaskRepository {
  final TaskService _service = TaskService();

  Future<List<TaskModel>> fetchTasks() async {
    final data = await _service.fetchTasks();
    return data.map(TaskModel.fromJson).toList();
  }

  Future<void> deleteTask(String id) {
    return _service.deleteTask(id);
  }
}

