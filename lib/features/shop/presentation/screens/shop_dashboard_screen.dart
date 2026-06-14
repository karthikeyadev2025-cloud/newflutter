import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../../core/widgets/metric_tile.dart';
import '../../../../core/widgets/responsive_value.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../data/sample_shop_data.dart';

class ShopDashboardScreen extends StatelessWidget {
  const ShopDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final desktop = responsiveValue(context, mobile: false, desktop: true);
    final padding = desktop ? const EdgeInsets.all(28) : const EdgeInsets.all(16);

    return ListView(
      padding: padding,
      children: [
        const _PageHeader(),
        const SizedBox(height: 20),
        GridView.count(
          crossAxisCount: desktop ? 4 : 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: desktop ? 1.65 : 1.25,
          children: const [
            MetricTile(label: "Today's sales", value: '₹12,480', caption: '+18% from yesterday', captionColor: AppColors.success),
            MetricTile(label: 'New orders', value: '24', caption: '6 pending', captionColor: AppColors.info),
            MetricTile(label: 'Low stock', value: '3', caption: 'Review today', captionColor: AppColors.warning),
            MetricTile(label: 'Credit due', value: '₹4,200', caption: '2 customers', captionColor: AppColors.danger),
          ],
        ),
        const SizedBox(height: 20),
        if (desktop)
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: _RecentBillsPanel()),
              SizedBox(width: 18),
              Expanded(flex: 2, child: _SideInsights()),
            ],
          )
        else ...[
          const _RecentBillsPanel(),
          const SizedBox(height: 14),
          const _SideInsights(),
        ],
      ],
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dashboard', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
              SizedBox(height: 4),
              Text("Overview of your store's performance today.", style: TextStyle(color: AppColors.muted)),
            ],
          ),
        ),
        FilledButton(
          onPressed: () {},
          child: const Text('Start Billing'),
        ),
      ],
    );
  }
}

class _RecentBillsPanel extends StatelessWidget {
  const _RecentBillsPanel();

  @override
  Widget build(BuildContext context) {
    return AppPanel(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(18),
            child: Text('Recent Bills', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
          ),
          const Divider(height: 1, color: AppColors.line),
          for (final bill in sampleBills)
            ListTile(
              title: Text(bill.number, style: const TextStyle(fontWeight: FontWeight.w800)),
              subtitle: Text('${bill.customer} • ${bill.time}'),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 12,
                children: [
                  Text('₹${bill.amount.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w900)),
                  StatusChip(
                    label: bill.status,
                    color: switch (bill.status) {
                      'Paid' => AppColors.success,
                      'Pending' => AppColors.warning,
                      _ => AppColors.danger,
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _SideInsights extends StatelessWidget {
  const _SideInsights();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Top Selling', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
              const SizedBox(height: 12),
              for (final product in sampleProducts.take(3))
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  child: Row(
                    children: [
                      Expanded(child: Text(product.name, style: const TextStyle(fontWeight: FontWeight.w700))),
                      Text('₹${product.price.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        AppPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Low Stock Alert', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
              const SizedBox(height: 8),
              const Text('3 items are running low. Review and restock before the weekend rush.', style: TextStyle(color: AppColors.muted)),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(onPressed: () {}, child: const Text('Review Restock List')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
