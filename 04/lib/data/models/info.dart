class Info {
  final String id;
  final String createdAt;
  final String name;
  final String avatar;
  final String email;

  Info({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.email,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      id: json['id']?.toString() ?? '',
      createdAt: json['createdAt']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      avatar: json['avatar']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'name': name,
      'avatar': avatar,
      'email': email,
    };
  }
}

