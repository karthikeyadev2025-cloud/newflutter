import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../../core/widgets/responsive_value.dart';
import '../../data/sample_shop_data.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final desktop = responsiveValue(context, mobile: false, desktop: true);

    return ListView(
      padding: EdgeInsets.all(desktop ? 28 : 16),
      children: [
        Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Products', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                  SizedBox(height: 4),
                  Text('Manage stock, barcode, GST, units, and pricing.', style: TextStyle(color: AppColors.muted)),
                ],
              ),
            ),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Add Product'),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search products',
                  prefixIcon: Icon(Icons.search, size: 18),
                ),
              ),
            ),
            const SizedBox(width: 10),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner, size: 18),
              label: const Text('Scan'),
            ),
          ],
        ),
        const SizedBox(height: 18),
        desktop ? const _ProductsTable() : const _ProductsList(),
      ],
    );
  }
}

class _ProductsTable extends StatelessWidget {
  const _ProductsTable();

  @override
  Widget build(BuildContext context) {
    return AppPanel(
      padding: EdgeInsets.zero,
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(AppColors.canvas),
        columns: const [
          DataColumn(label: Text('Product')),
          DataColumn(label: Text('Category')),
          DataColumn(label: Text('Stock')),
          DataColumn(label: Text('GST')),
          DataColumn(label: Text('Price'), numeric: true),
          DataColumn(label: Text('')),
        ],
        rows: [
          for (final product in sampleProducts)
            DataRow(
              cells: [
                DataCell(Text(product.name, style: const TextStyle(fontWeight: FontWeight.w800))),
                DataCell(Text(product.category)),
                DataCell(Text('${product.stock} ${product.unit}')),
                DataCell(Text('${product.gstRate}%')),
                DataCell(Text('₹${product.price.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w900))),
                DataCell(IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz, size: 18))),
              ],
            ),
        ],
      ),
    );
  }
}

class _ProductsList extends StatelessWidget {
  const _ProductsList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final product in sampleProducts)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: AppPanel(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name, style: const TextStyle(fontWeight: FontWeight.w900)),
                        const SizedBox(height: 4),
                        Text('${product.category} • GST ${product.gstRate}% • Stock ${product.stock}', style: const TextStyle(color: AppColors.muted)),
                      ],
                    ),
                  ),
                  Text('₹${product.price.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w900)),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
