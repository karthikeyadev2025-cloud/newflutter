import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../core/widgets/app_panel.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(28),
      children: [
        const Text('Platform Settings', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        const Text('Pricing, maintenance mode, announcements, integrations, and audit controls.', style: TextStyle(color: AppColors.muted)),
        const SizedBox(height: 18),
        AppPanel(
          child: Column(
            children: [
              SwitchListTile(
                value: false,
                onChanged: (_) {},
                title: const Text('Maintenance Mode', style: TextStyle(fontWeight: FontWeight.w900)),
                subtitle: const Text('Temporarily block non-admin users from the app.'),
              ),
              const Divider(color: AppColors.line),
              SwitchListTile(
                value: true,
                onChanged: (_) {},
                title: const Text('New Shop Approvals', style: TextStyle(fontWeight: FontWeight.w900)),
                subtitle: const Text('Require super admin approval before shops go live.'),
              ),
              const Divider(color: AppColors.line),
              ListTile(
                title: const Text('Razorpay Key', style: TextStyle(fontWeight: FontWeight.w900)),
                subtitle: const Text('Configured through secure environment variables.'),
                trailing: OutlinedButton(onPressed: () {}, child: const Text('Check')),
              ),
              const Divider(color: AppColors.line),
              ListTile(
                title: const Text('Announcement Banner', style: TextStyle(fontWeight: FontWeight.w900)),
                subtitle: const Text('Show platform-wide alerts to all users.'),
                trailing: FilledButton(onPressed: () {}, child: const Text('Edit')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
