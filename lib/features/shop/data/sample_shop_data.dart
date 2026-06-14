import '../domain/shop_models.dart';

const sampleProducts = [
  Product(name: 'Sona Masoori Rice', category: 'Grocery', price: 1250, stock: 42, unit: '25 kg', gstRate: 5),
  Product(name: 'Fortune Oil 5L', category: 'Grocery', price: 650, stock: 18, unit: 'can', gstRate: 5),
  Product(name: 'Amul Milk 1L', category: 'Dairy', price: 68, stock: 7, unit: 'packet', gstRate: 0),
  Product(name: 'Parle-G Biscuit', category: 'Snacks', price: 10, stock: 140, unit: 'pack', gstRate: 5),
  Product(name: 'Surf Excel 1kg', category: 'Home Care', price: 210, stock: 9, unit: 'pack', gstRate: 18),
  Product(name: 'Tata Salt 1kg', category: 'Grocery', price: 28, stock: 55, unit: 'pack', gstRate: 0),
];

const sampleBills = [
  Bill(number: 'INV-1042', customer: 'Ramesh Kumar', amount: 1250, status: 'Paid', time: '10:42 AM'),
  Bill(number: 'INV-1041', customer: 'Walk-in Customer', amount: 480, status: 'Paid', time: '10:18 AM'),
  Bill(number: 'INV-1040', customer: 'Sai Traders', amount: 3600, status: 'Pending', time: '09:55 AM'),
  Bill(number: 'INV-1039', customer: 'Priya S', amount: 920, status: 'Paid', time: 'Yesterday'),
  Bill(number: 'INV-1038', customer: 'Anand Stores', amount: 5140, status: 'Overdue', time: 'Yesterday'),
];

final sampleCart = [
  CartLine(product: sampleProducts[0], quantity: 1),
  CartLine(product: sampleProducts[3], quantity: 4),
  CartLine(product: sampleProducts[5], quantity: 2),
];
