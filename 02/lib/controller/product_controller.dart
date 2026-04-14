import 'package:nguyenminhvuong_api/data/models/product.dart';
import 'package:nguyenminhvuong_api/data/repository/product_repository.dart';

class ProductController {
  final ProductRepository _repo = ProductRepository();

  Future<Product> fetchProduct(int id) {
    return _repo.getProduct(id);
  }
}