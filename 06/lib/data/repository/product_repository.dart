import 'package:nguyenminhvuong_api/data/models/product_model.dart';
import 'package:nguyenminhvuong_api/data/service/product_service.dart';

class ProductRepository {
  final ProductService _service = ProductService();

  Future<List<ProductModel>> searchByKeyword(String keyword) async {
    final data = await _service.searchProducts(keyword);
    return data.map(ProductModel.fromJson).toList();
  }
}

