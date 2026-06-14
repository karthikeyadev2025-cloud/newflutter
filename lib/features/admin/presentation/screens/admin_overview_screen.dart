import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../../core/widgets/metric_tile.dart';
import '../../../../core/widgets/responsive_value.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../data/sample_admin_data.dart';

class AdminOverviewScreen extends StatelessWidget {
  const AdminOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final desktop = responsiveValue(context, mobile: false, desktop: true);

    return ListView(
      padding: EdgeInsets.all(desktop ? 28 : 16),
      children: [
        const Text('Platform Overview', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        const Text('Approvals, revenue, trials, support, and platform health.', style: TextStyle(color: AppColors.muted)),
        const SizedBox(height: 20),
        GridView.count(
          crossAxisCount: desktop ? 4 : 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: desktop ? 1.65 : 1.18,
          children: const [
            MetricTile(label: 'Active shops', value: '1,248', caption: '+42 this month', captionColor: AppColors.success),
            MetricTile(label: 'MRR', value: '₹8.4L', caption: '+11.2%', captionColor: AppColors.success),
            MetricTile(label: 'Pending approval', value: '18', caption: 'Needs review', captionColor: AppColors.warning),
            MetricTile(label: 'Open tickets', value: '27', caption: '5 urgent', captionColor: AppColors.danger),
          ],
        ),
        const SizedBox(height: 20),
        AppPanel(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(18),
                child: Text('Action Queue', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
              ),
              const Divider(height: 1, color: AppColors.line),
              for (final user in sampleAdminUsers)
                ListTile(
                  title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.w900)),
                  subtitle: Text('${user.role} • ${user.plan}'),
                  trailing: StatusChip(label: user.status, color: _statusColor(user.status)),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

Color _statusColor(String status) {
  return switch (status) {
    'Active' => AppColors.success,
    'Pending' => AppColors.warning,
    _ => AppColors.danger,
  };
}
