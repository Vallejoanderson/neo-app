class Product {
  final int categoryId;
  final int subcategoryId;
  final int id;
  final String name;
  final double price;

  const Product({
    required this.categoryId,
    required this.subcategoryId,
    required this.id,
    required this.name,
    required this.price,
  });

  @override
    String toString() {
      return 'Product(id: $id, name: $name, price: $price)';
  }
}