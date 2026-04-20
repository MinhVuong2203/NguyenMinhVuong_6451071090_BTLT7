import 'package:flutter/material.dart';
import 'package:nguyenminhvuong_api/controller/task_controller.dart';
import 'package:nguyenminhvuong_api/data/models/task_model.dart';

class TaskDeleteScreen extends StatefulWidget {
  const TaskDeleteScreen({super.key});

  @override
  State<TaskDeleteScreen> createState() => _TaskDeleteScreenState();
}

class _TaskDeleteScreenState extends State<TaskDeleteScreen> {
  final TaskController _controller = TaskController();

  List<TaskModel> _tasks = <TaskModel>[];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    setState(() => _isLoading = true);

    try {
      final tasks = await _controller.fetchTasks();
      if (!mounted) {
        return;
      }
      setState(() => _tasks = tasks);
    } catch (e) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Load tasks failed: $e')));
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<bool> _handleDelete(TaskModel task, int index) async {
    try {
      await _controller.deleteTask(task.id);
      if (!mounted) {
        return false;
      }

      setState(() => _tasks.removeAt(index));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Deleted task: ${task.title}')),
      );
      return true;
    } catch (e) {
      if (!mounted) {
        return false;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Delete failed: $e')));
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Task (DELETE API)'),
        actions: [
          IconButton(
            onPressed: _isLoading ? null : _loadTasks,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _tasks.isEmpty
              ? const Center(child: Text('No tasks found'))
              : ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    final task = _tasks[index];
                    return Dismissible(
                      key: ValueKey<String>(task.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.red,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      confirmDismiss: (_) => _handleDelete(task, index),
                      child: ListTile(
                        title: Text(task.title),
                        subtitle: Text(task.description),
                        leading: Icon(
                          task.isDone
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: task.isDone ? Colors.green : Colors.grey,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () => _handleDelete(task, index),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

