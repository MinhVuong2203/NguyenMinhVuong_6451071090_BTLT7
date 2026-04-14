import 'package:nguyenminhvuong_api/data/models/product.dart';
import 'package:nguyenminhvuong_api/data/service/product_service.dart';

class ProductRepository {
  final ProductService _service = ProductService();

  Future<Product> getProduct(int id) async {
    final data = await _service.fetchProduct(id);
    return Product.fromJson(data);
  }
}