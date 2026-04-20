import 'package:nguyenminhvuong_api/data/models/task_model.dart';
import 'package:nguyenminhvuong_api/data/repository/task_repository.dart';

class TaskController {
  final TaskRepository _repo = TaskRepository();

  Future<List<TaskModel>> fetchTasks() {
    return _repo.fetchTasks();
  }

  Future<void> deleteTask(String id) {
    return _repo.deleteTask(id);
  }
}

