class TaskModel {
  final String id;
  final String createdAt;
  final String title;
  final String description;
  final bool isDone;

  TaskModel({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.isDone,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id']?.toString() ?? '',
      createdAt: json['createdAt']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      isDone: json['isDone'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }
}

