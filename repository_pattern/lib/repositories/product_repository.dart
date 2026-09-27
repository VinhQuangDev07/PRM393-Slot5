import '../models/product.dart';

class ProductRepository {
  Future<List<Product>> getProducts() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    return [
      Product(
        id: 1,
        name: 'Nike Air Force 1',
        price: 2500000,
      ),
      Product(
        id: 2,
        name: 'Adidas Superstar',
        price: 2200000,
      ),
      Product(
        id: 3,
        name: 'Puma Suede',
        price: 1800000,
      ),
    ];
  }
}
