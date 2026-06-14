class Product {
  const Product({
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
    required this.unit,
    required this.gstRate,
  });

  final String name;
  final String category;
  final double price;
  final int stock;
  final String unit;
  final int gstRate;
}

class Bill {
  const Bill({
    required this.number,
    required this.customer,
    required this.amount,
    required this.status,
    required this.time,
  });

  final String number;
  final String customer;
  final double amount;
  final String status;
  final String time;
}

class CartLine {
  const CartLine({
    required this.product,
    required this.quantity,
  });

  final Product product;
  final int quantity;

  double get total => product.price * quantity;
}
