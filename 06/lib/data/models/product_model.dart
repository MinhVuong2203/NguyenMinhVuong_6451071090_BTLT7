class ProductModel {
  final String id;
  final String createdAt;
  final String name;
  final String description;
  final double price;
  final String image;
  final String category;
  final String phone;

  ProductModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.phone,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final dynamic rawPrice = json['price'];
    return ProductModel(
      id: json['id']?.toString() ?? '',
      createdAt: json['createdAt']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      price: rawPrice is num ? rawPrice.toDouble() : double.tryParse(rawPrice?.toString() ?? '') ?? 0,
      image: json['image']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
    );
  }
}

