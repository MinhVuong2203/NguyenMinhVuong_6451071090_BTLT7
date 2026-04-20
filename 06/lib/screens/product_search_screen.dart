import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nguyenminhvuong_api/data/models/product_model.dart';
import 'package:nguyenminhvuong_api/data/repository/product_repository.dart';

class ProductSearchScreen extends StatefulWidget {
  const ProductSearchScreen({super.key});

  @override
  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final ProductRepository _repository = ProductRepository();

  List<ProductModel> _products = [];
  bool _isLoading = false;

  Timer? _debounce;

  void _onSearchChanged(String keyword) {
    // debounce để tránh spam API
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _search(keyword);
    });
  }

  Future<void> _search(String keyword) async {
    if (keyword.trim().isEmpty) {
      setState(() => _products = []);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final result = await _repository.searchByKeyword(keyword);
      setState(() => _products = result);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }

    setState(() => _isLoading = false);
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  Widget _buildItem(ProductModel product) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(
          product.image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Icon(Icons.image),
        ),
        title: Text(product.name),
        subtitle: Text(product.description),
        trailing: Text("\$${product.price}"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Products")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 Search input
            TextField(
              controller: _controller,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: "Enter keyword...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ⏳ Loading
            if (_isLoading) const CircularProgressIndicator(),

            const SizedBox(height: 16),

            // 📋 List
            Expanded(
              child: _products.isEmpty
                  ? const Center(child: Text("No results"))
                  : ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return _buildItem(_products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}