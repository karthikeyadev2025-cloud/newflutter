import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../../core/widgets/responsive_value.dart';
import '../../data/sample_shop_data.dart';

class ShopPosScreen extends StatelessWidget {
  const ShopPosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final desktop = responsiveValue(context, mobile: false, desktop: true);
    final padding = desktop ? const EdgeInsets.all(24) : const EdgeInsets.all(14);

    if (!desktop) {
      return ListView(
        padding: padding,
        children: const [
          _PosHeader(),
          SizedBox(height: 12),
          _SearchAndScan(),
          SizedBox(height: 12),
          _MobileCartSummary(),
          SizedBox(height: 12),
          _ProductGrid(),
        ],
      );
    }

    return Padding(
      padding: padding,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 180, child: _CategoryRail()),
          SizedBox(width: 18),
          Expanded(child: _DesktopProductArea()),
          SizedBox(width: 18),
          SizedBox(width: 380, child: _CartPanel()),
        ],
      ),
    );
  }
}

class _PosHeader extends StatelessWidget {
  const _PosHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('POS Billing', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
        SizedBox(height: 4),
        Text('Search, scan, add items, and complete sale.', style: TextStyle(color: AppColors.muted)),
      ],
    );
  }
}

class _DesktopProductArea extends StatelessWidget {
  const _DesktopProductArea();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _SearchAndScan(),
        SizedBox(height: 16),
        Expanded(child: _ProductGrid()),
      ],
    );
  }
}

class _SearchAndScan extends StatelessWidget {
  const _SearchAndScan();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Search item or scan barcode',
              prefixIcon: Icon(Icons.search, size: 18),
            ),
          ),
        ),
        const SizedBox(width: 10),
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.qr_code_scanner, size: 18),
          label: const Text('Scan'),
        ),
      ],
    );
  }
}

class _CategoryRail extends StatelessWidget {
  const _CategoryRail();

  @override
  Widget build(BuildContext context) {
    const categories = ['All Items', 'Grocery', 'Dairy', 'Snacks', 'Home Care'];
    return AppPanel(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('Categories', style: TextStyle(fontWeight: FontWeight.w900)),
          ),
          for (var i = 0; i < categories.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  backgroundColor: i == 0 ? AppColors.primary.withValues(alpha: 0.1) : null,
                  foregroundColor: i == 0 ? AppColors.primary : AppColors.inkSoft,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(categories[i], style: const TextStyle(fontWeight: FontWeight.w800)),
              ),
            ),
        ],
      ),
    );
  }
}

class _ProductGrid extends StatelessWidget {
  const _ProductGrid();

  @override
  Widget build(BuildContext context) {
    final desktop = responsiveValue(context, mobile: false, desktop: true);
    return GridView.builder(
      shrinkWrap: !desktop,
      physics: desktop ? null : const NeverScrollableScrollPhysics(),
      itemCount: sampleProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: desktop ? 3 : 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: desktop ? 1.35 : 1.05,
      ),
      itemBuilder: (context, index) {
        final product = sampleProducts[index];
        return AppPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w900)),
              const SizedBox(height: 6),
              Text('${product.category} • ${product.unit}', style: const TextStyle(color: AppColors.muted, fontSize: 12)),
              const Spacer(),
              Row(
                children: [
                  Expanded(child: Text('₹${product.price.toStringAsFixed(0)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900))),
                  IconButton.filled(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 18),
                  ),
                ],
              ),
              Text('Stock ${product.stock}', style: TextStyle(color: product.stock < 10 ? AppColors.warning : AppColors.muted, fontSize: 12, fontWeight: FontWeight.w700)),
            ],
          ),
        );
      },
    );
  }
}

class _CartPanel extends StatelessWidget {
  const _CartPanel();

  @override
  Widget build(BuildContext context) {
    final subtotal = sampleCart.fold<double>(0, (sum, line) => sum + line.total);
    final gst = subtotal * 0.05;
    final total = subtotal + gst;

    return AppPanel(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(18),
            child: Row(
              children: [
                Expanded(child: Text('Current Bill', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900))),
                Icon(Icons.person_outline, size: 18, color: AppColors.muted),
                SizedBox(width: 6),
                Text('Walk-in', style: TextStyle(fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.line),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                for (final line in sampleCart)
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(line.product.name, style: const TextStyle(fontWeight: FontWeight.w800)),
                    subtitle: Text('₹${line.product.price.toStringAsFixed(0)} x ${line.quantity}'),
                    trailing: Text('₹${line.total.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w900)),
                  ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.line),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                _TotalRow(label: 'Subtotal', value: subtotal),
                _TotalRow(label: 'GST', value: gst),
                const Divider(height: 22),
                _TotalRow(label: 'Total', value: total, large: true),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.currency_rupee, size: 18),
                    label: const Text('Complete Sale'),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Draft'))),
                    const SizedBox(width: 8),
                    Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Share'))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileCartSummary extends StatelessWidget {
  const _MobileCartSummary();

  @override
  Widget build(BuildContext context) {
    final total = sampleCart.fold<double>(0, (sum, line) => sum + line.total);
    return FilledButton(
      onPressed: () {},
      child: Text('View Bill - ₹${total.toStringAsFixed(0)}'),
    );
  }
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({required this.label, required this.value, this.large = false});

  final String label;
  final double value;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label, style: TextStyle(color: large ? AppColors.ink : AppColors.muted, fontWeight: FontWeight.w700))),
          Text(
            '₹${value.toStringAsFixed(0)}',
            style: TextStyle(fontSize: large ? 22 : 14, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
