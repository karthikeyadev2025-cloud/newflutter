import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../core/widgets/app_panel.dart';
import '../../../../core/widgets/status_chip.dart';

class AdminSupportScreen extends StatelessWidget {
  const AdminSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const tickets = [
      ('TCK-2401', 'Razorpay payment failed', 'Urgent', AppColors.danger),
      ('TCK-2400', 'Need GST report export', 'Open', AppColors.warning),
      ('TCK-2399', 'Barcode scanner not opening', 'Open', AppColors.warning),
      ('TCK-2398', 'Shop approval request', 'Resolved', AppColors.success),
    ];

    return ListView(
      padding: const EdgeInsets.all(28),
      children: [
        const Text('Support', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        const Text('Tickets, customer messages, bot handoff, and status tracking.', style: TextStyle(color: AppColors.muted)),
        const SizedBox(height: 18),
        AppPanel(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              for (final ticket in tickets)
                ListTile(
                  leading: const Icon(Icons.forum_outlined),
                  title: Text(ticket.$2, style: const TextStyle(fontWeight: FontWeight.w900)),
                  subtitle: Text(ticket.$1),
                  trailing: StatusChip(label: ticket.$3, color: ticket.$4),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
