import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../../core/widgets/metric_tile.dart';

class AdminRevenueScreen extends StatelessWidget {
  const AdminRevenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(28),
      children: [
        const Text('Revenue', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        const Text('Subscriptions, Razorpay payments, failed renewals, and plan performance.', style: TextStyle(color: AppColors.muted)),
        const SizedBox(height: 20),
        const Row(
          children: [
            Expanded(child: MetricTile(label: 'MRR', value: '₹8.4L', caption: '+11.2%', captionColor: AppColors.success)),
            SizedBox(width: 14),
            Expanded(child: MetricTile(label: 'Paid shops', value: '842', caption: '67.4% conversion', captionColor: AppColors.info)),
            SizedBox(width: 14),
            Expanded(child: MetricTile(label: 'Failed payments', value: '19', caption: 'Retry needed', captionColor: AppColors.warning)),
          ],
        ),
        const SizedBox(height: 20),
        AppPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Plan Performance', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
              const SizedBox(height: 18),
              for (final row in const [
                ('Starter', 220, 149000),
                ('Pro', 516, 512000),
                ('Business', 106, 181000),
              ])
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Row(
                    children: [
                      const Icon(Icons.currency_rupee, color: AppColors.primary, size: 18),
                      const SizedBox(width: 10),
                      Expanded(child: Text(row.$1, style: const TextStyle(fontWeight: FontWeight.w900))),
                      Text('${row.$2} shops', style: const TextStyle(color: AppColors.muted)),
                      const SizedBox(width: 18),
                      Text('₹${row.$3}', style: const TextStyle(fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
