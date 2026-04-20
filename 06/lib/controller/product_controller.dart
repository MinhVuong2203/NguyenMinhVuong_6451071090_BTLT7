import 'package:flutter/foundation.dart';
import 'package:nguyenminhvuong_api/data/models/product_model.dart';
import 'package:nguyenminhvuong_api/data/repository/product_repository.dart';

class ProductController extends ChangeNotifier {
  final ProductRepository _repo = ProductRepository();

  List<ProductModel> items = <ProductModel>[];
  bool isLoading = false;
  String? errorMessage;

  Future<void> search(String keyword) async {
    final value = keyword.trim();
    if (value.isEmpty) {
      items = <ProductModel>[];
      errorMessage = null;
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      items = await _repo.searchByKeyword(value);
    } catch (e) {
      items = <ProductModel>[];
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

