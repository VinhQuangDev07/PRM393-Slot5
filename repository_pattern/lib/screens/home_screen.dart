import 'package:flutter/material.dart';

import '../models/product.dart';
import '../repositories/product_repository.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ProductRepository repository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),

      body: FutureBuilder<List<Product>>(
        future: repository.getProducts(),

        builder: (context, snapshot) {
          // 1. Đang loading
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // 2. Có lỗi
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Có lỗi xảy ra: ${snapshot.error}',
              ),
            );
          }

          // 3. Không có dữ liệu
          if (!snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Không có sản phẩm',
              ),
            );
          }

          // 4. Có dữ liệu
          final products = snapshot.data!;

          return ListView.builder(
            itemCount: products.length,

            itemBuilder: (context, index) {
              final product = products[index];

              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    '${product.id}',
                  ),
                ),

                title: Text(
                  product.name,
                ),

                subtitle: Text(
                  '${product.price.toStringAsFixed(0)} VNĐ',
                ),
              );
            },
          );
        },
      ),
    );
  }
}