import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nguyenminhvuong_api/controller/product_controller.dart';
import 'package:nguyenminhvuong_api/data/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductController controller = ProductController();

  ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Detail")),
      body: FutureBuilder<Product>(
        future: controller.fetchProduct(1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final product = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IMAGE
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.image,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 16),

                // TITLE
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // PRICE
                Text(
                  "Price: ${product.price}",
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),

                const SizedBox(height: 10),

                // DESCRIPTION
                Text(product.description),
              ],
            ),
          );
        },
      ),
    );
  }
}